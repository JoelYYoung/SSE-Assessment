; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %0, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !52
  %cmp1 = icmp ult i64 %2, 100, !dbg !54
  br i1 %cmp1, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !58
  %4 = load i32, i32* %arrayidx, align 4, !dbg !58
  %5 = load i32*, i32** %data, align 8, !dbg !59
  %6 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !59
  store i32 %4, i32* %arrayidx2, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %7, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !68
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !68
  call void @printIntLine(i32 %9), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32, i32* @staticFive, align 4, !dbg !102
  %cmp = icmp ne i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !121
  %cmp1 = icmp ult i64 %2, 100, !dbg !123
  br i1 %cmp1, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !127
  %4 = load i32, i32* %arrayidx, align 4, !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  %6 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !128
  store i32 %4, i32* %arrayidx2, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %7, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !136
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !136
  call void @printIntLine(i32 %9), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = load i32, i32* @staticFive, align 4, !dbg !146
  %cmp = icmp eq i32 %0, 5, !dbg !148
  br i1 %cmp, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !150
  store i32* %arraydecay, i32** %data, align 8, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !163
  %cmp1 = icmp ult i64 %2, 100, !dbg !165
  br i1 %cmp1, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !169
  %4 = load i32, i32* %arrayidx, align 4, !dbg !169
  %5 = load i32*, i32** %data, align 8, !dbg !170
  %6 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !170
  store i32 %4, i32* %arrayidx2, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %7, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !178
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !178
  call void @printIntLine(i32 %9), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!21 = !DILocation(line: 29, column: 11, scope: !16)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 30, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 30, column: 9, scope: !16)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 31, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 31, column: 9, scope: !16)
!32 = !DILocation(line: 32, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 8, scope: !16)
!36 = !DILocation(line: 36, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !8, line: 33, column: 5)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 37, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !8, line: 39, type: !28)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 5)
!42 = !DILocation(line: 39, column: 13, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !8, line: 41, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !8, line: 40, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 41, column: 20, scope: !44)
!49 = !DILocation(line: 43, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !8, line: 43, column: 13)
!51 = !DILocation(line: 43, column: 18, scope: !50)
!52 = !DILocation(line: 43, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !8, line: 43, column: 13)
!54 = !DILocation(line: 43, column: 27, scope: !53)
!55 = !DILocation(line: 43, column: 13, scope: !50)
!56 = !DILocation(line: 45, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !8, line: 44, column: 13)
!58 = !DILocation(line: 45, column: 27, scope: !57)
!59 = !DILocation(line: 45, column: 17, scope: !57)
!60 = !DILocation(line: 45, column: 22, scope: !57)
!61 = !DILocation(line: 45, column: 25, scope: !57)
!62 = !DILocation(line: 46, column: 13, scope: !57)
!63 = !DILocation(line: 43, column: 35, scope: !53)
!64 = !DILocation(line: 43, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 46, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 47, column: 26, scope: !44)
!69 = !DILocation(line: 47, column: 13, scope: !44)
!70 = !DILocation(line: 50, column: 1, scope: !16)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_07_good", scope: !8, file: !8, line: 111, type: !17, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 113, column: 5, scope: !71)
!73 = !DILocation(line: 114, column: 5, scope: !71)
!74 = !DILocation(line: 115, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 127, type: !76, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!9, !9, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !8, line: 127, type: !9)
!82 = !DILocation(line: 127, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !8, line: 127, type: !78)
!84 = !DILocation(line: 127, column: 27, scope: !75)
!85 = !DILocation(line: 130, column: 22, scope: !75)
!86 = !DILocation(line: 130, column: 12, scope: !75)
!87 = !DILocation(line: 130, column: 5, scope: !75)
!88 = !DILocation(line: 132, column: 5, scope: !75)
!89 = !DILocation(line: 133, column: 5, scope: !75)
!90 = !DILocation(line: 134, column: 5, scope: !75)
!91 = !DILocation(line: 137, column: 5, scope: !75)
!92 = !DILocation(line: 138, column: 5, scope: !75)
!93 = !DILocation(line: 139, column: 5, scope: !75)
!94 = !DILocation(line: 141, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !8, line: 59, type: !20)
!97 = !DILocation(line: 59, column: 11, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !8, line: 60, type: !23)
!99 = !DILocation(line: 60, column: 9, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !8, line: 61, type: !28)
!101 = !DILocation(line: 61, column: 9, scope: !95)
!102 = !DILocation(line: 62, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !8, line: 62, column: 8)
!104 = !DILocation(line: 62, column: 18, scope: !103)
!105 = !DILocation(line: 62, column: 8, scope: !95)
!106 = !DILocation(line: 65, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !8, line: 63, column: 5)
!108 = !DILocation(line: 66, column: 5, scope: !107)
!109 = !DILocation(line: 70, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !8, line: 68, column: 5)
!111 = !DILocation(line: 70, column: 14, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !113, file: !8, line: 73, type: !28)
!113 = distinct !DILexicalBlock(scope: !95, file: !8, line: 72, column: 5)
!114 = !DILocation(line: 73, column: 13, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !8, line: 75, type: !45)
!116 = distinct !DILexicalBlock(scope: !113, file: !8, line: 74, column: 9)
!117 = !DILocation(line: 75, column: 20, scope: !116)
!118 = !DILocation(line: 77, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !8, line: 77, column: 13)
!120 = !DILocation(line: 77, column: 18, scope: !119)
!121 = !DILocation(line: 77, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !8, line: 77, column: 13)
!123 = !DILocation(line: 77, column: 27, scope: !122)
!124 = !DILocation(line: 77, column: 13, scope: !119)
!125 = !DILocation(line: 79, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !8, line: 78, column: 13)
!127 = !DILocation(line: 79, column: 27, scope: !126)
!128 = !DILocation(line: 79, column: 17, scope: !126)
!129 = !DILocation(line: 79, column: 22, scope: !126)
!130 = !DILocation(line: 79, column: 25, scope: !126)
!131 = !DILocation(line: 80, column: 13, scope: !126)
!132 = !DILocation(line: 77, column: 35, scope: !122)
!133 = !DILocation(line: 77, column: 13, scope: !122)
!134 = distinct !{!134, !124, !135, !67}
!135 = !DILocation(line: 80, column: 13, scope: !119)
!136 = !DILocation(line: 81, column: 26, scope: !116)
!137 = !DILocation(line: 81, column: 13, scope: !116)
!138 = !DILocation(line: 84, column: 1, scope: !95)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !8, line: 89, type: !20)
!141 = !DILocation(line: 89, column: 11, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !8, line: 90, type: !23)
!143 = !DILocation(line: 90, column: 9, scope: !139)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !8, line: 91, type: !28)
!145 = !DILocation(line: 91, column: 9, scope: !139)
!146 = !DILocation(line: 92, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !8, line: 92, column: 8)
!148 = !DILocation(line: 92, column: 18, scope: !147)
!149 = !DILocation(line: 92, column: 8, scope: !139)
!150 = !DILocation(line: 95, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !8, line: 93, column: 5)
!152 = !DILocation(line: 95, column: 14, scope: !151)
!153 = !DILocation(line: 96, column: 5, scope: !151)
!154 = !DILocalVariable(name: "source", scope: !155, file: !8, line: 98, type: !28)
!155 = distinct !DILexicalBlock(scope: !139, file: !8, line: 97, column: 5)
!156 = !DILocation(line: 98, column: 13, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !8, line: 100, type: !45)
!158 = distinct !DILexicalBlock(scope: !155, file: !8, line: 99, column: 9)
!159 = !DILocation(line: 100, column: 20, scope: !158)
!160 = !DILocation(line: 102, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !8, line: 102, column: 13)
!162 = !DILocation(line: 102, column: 18, scope: !161)
!163 = !DILocation(line: 102, column: 25, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !8, line: 102, column: 13)
!165 = !DILocation(line: 102, column: 27, scope: !164)
!166 = !DILocation(line: 102, column: 13, scope: !161)
!167 = !DILocation(line: 104, column: 34, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !8, line: 103, column: 13)
!169 = !DILocation(line: 104, column: 27, scope: !168)
!170 = !DILocation(line: 104, column: 17, scope: !168)
!171 = !DILocation(line: 104, column: 22, scope: !168)
!172 = !DILocation(line: 104, column: 25, scope: !168)
!173 = !DILocation(line: 105, column: 13, scope: !168)
!174 = !DILocation(line: 102, column: 35, scope: !164)
!175 = !DILocation(line: 102, column: 13, scope: !164)
!176 = distinct !{!176, !166, !177, !67}
!177 = !DILocation(line: 105, column: 13, scope: !161)
!178 = !DILocation(line: 106, column: 26, scope: !158)
!179 = !DILocation(line: 106, column: 13, scope: !158)
!180 = !DILocation(line: 109, column: 1, scope: !139)
