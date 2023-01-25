; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %0, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !59
  %4 = load i32, i32* %arrayidx, align 4, !dbg !59
  %5 = load i32*, i32** %data, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !60
  store i32 %4, i32* %arrayidx1, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %7, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !69
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !69
  call void @printIntLine(i32 %9), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @staticFalse, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

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
  %cmp = icmp ult i64 %2, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !127
  %4 = load i32, i32* %arrayidx, align 4, !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  %6 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !128
  store i32 %4, i32* %arrayidx1, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %7, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !136
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !136
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !146
  %tobool = icmp ne i32 %0, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !149
  store i32* %arraydecay, i32** %data, align 8, !dbg !151
  br label %if.end, !dbg !152

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !162
  %cmp = icmp ult i64 %2, 100, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !168
  %4 = load i32, i32* %arrayidx, align 4, !dbg !168
  %5 = load i32*, i32** %data, align 8, !dbg !169
  %6 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !169
  store i32 %4, i32* %arrayidx1, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %7, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !177
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !177
  call void @printIntLine(i32 %9), !dbg !178
  ret void, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!23 = !DILocation(line: 30, column: 11, scope: !18)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 31, column: 9, scope: !18)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 32, column: 9, scope: !18)
!34 = !DILocation(line: 33, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!36 = !DILocation(line: 33, column: 8, scope: !18)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 34, column: 5)
!39 = !DILocation(line: 37, column: 14, scope: !38)
!40 = !DILocation(line: 38, column: 5, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !10, line: 40, type: !30)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 5)
!43 = !DILocation(line: 40, column: 13, scope: !42)
!44 = !DILocalVariable(name: "i", scope: !45, file: !10, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !42, file: !10, line: 41, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 20, scope: !45)
!50 = !DILocation(line: 44, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !10, line: 44, column: 13)
!52 = !DILocation(line: 44, column: 18, scope: !51)
!53 = !DILocation(line: 44, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !10, line: 44, column: 13)
!55 = !DILocation(line: 44, column: 27, scope: !54)
!56 = !DILocation(line: 44, column: 13, scope: !51)
!57 = !DILocation(line: 46, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !10, line: 45, column: 13)
!59 = !DILocation(line: 46, column: 27, scope: !58)
!60 = !DILocation(line: 46, column: 17, scope: !58)
!61 = !DILocation(line: 46, column: 22, scope: !58)
!62 = !DILocation(line: 46, column: 25, scope: !58)
!63 = !DILocation(line: 47, column: 13, scope: !58)
!64 = !DILocation(line: 44, column: 35, scope: !54)
!65 = !DILocation(line: 44, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 47, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 48, column: 26, scope: !45)
!70 = !DILocation(line: 48, column: 13, scope: !45)
!71 = !DILocation(line: 51, column: 1, scope: !18)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_good", scope: !10, file: !10, line: 112, type: !19, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 114, column: 5, scope: !72)
!74 = !DILocation(line: 115, column: 5, scope: !72)
!75 = !DILocation(line: 116, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 128, type: !77, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!11, !11, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !10, line: 128, type: !11)
!83 = !DILocation(line: 128, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !10, line: 128, type: !79)
!85 = !DILocation(line: 128, column: 27, scope: !76)
!86 = !DILocation(line: 131, column: 22, scope: !76)
!87 = !DILocation(line: 131, column: 12, scope: !76)
!88 = !DILocation(line: 131, column: 5, scope: !76)
!89 = !DILocation(line: 133, column: 5, scope: !76)
!90 = !DILocation(line: 134, column: 5, scope: !76)
!91 = !DILocation(line: 135, column: 5, scope: !76)
!92 = !DILocation(line: 138, column: 5, scope: !76)
!93 = !DILocation(line: 139, column: 5, scope: !76)
!94 = !DILocation(line: 140, column: 5, scope: !76)
!95 = !DILocation(line: 142, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 60, type: !22)
!98 = !DILocation(line: 60, column: 11, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !10, line: 61, type: !25)
!100 = !DILocation(line: 61, column: 9, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !10, line: 62, type: !30)
!102 = !DILocation(line: 62, column: 9, scope: !96)
!103 = !DILocation(line: 63, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !10, line: 63, column: 8)
!105 = !DILocation(line: 63, column: 8, scope: !96)
!106 = !DILocation(line: 66, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !10, line: 64, column: 5)
!108 = !DILocation(line: 67, column: 5, scope: !107)
!109 = !DILocation(line: 71, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !10, line: 69, column: 5)
!111 = !DILocation(line: 71, column: 14, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !113, file: !10, line: 74, type: !30)
!113 = distinct !DILexicalBlock(scope: !96, file: !10, line: 73, column: 5)
!114 = !DILocation(line: 74, column: 13, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !10, line: 76, type: !46)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 75, column: 9)
!117 = !DILocation(line: 76, column: 20, scope: !116)
!118 = !DILocation(line: 78, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 78, column: 13)
!120 = !DILocation(line: 78, column: 18, scope: !119)
!121 = !DILocation(line: 78, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !10, line: 78, column: 13)
!123 = !DILocation(line: 78, column: 27, scope: !122)
!124 = !DILocation(line: 78, column: 13, scope: !119)
!125 = !DILocation(line: 80, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !10, line: 79, column: 13)
!127 = !DILocation(line: 80, column: 27, scope: !126)
!128 = !DILocation(line: 80, column: 17, scope: !126)
!129 = !DILocation(line: 80, column: 22, scope: !126)
!130 = !DILocation(line: 80, column: 25, scope: !126)
!131 = !DILocation(line: 81, column: 13, scope: !126)
!132 = !DILocation(line: 78, column: 35, scope: !122)
!133 = !DILocation(line: 78, column: 13, scope: !122)
!134 = distinct !{!134, !124, !135, !68}
!135 = !DILocation(line: 81, column: 13, scope: !119)
!136 = !DILocation(line: 82, column: 26, scope: !116)
!137 = !DILocation(line: 82, column: 13, scope: !116)
!138 = !DILocation(line: 85, column: 1, scope: !96)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !10, line: 90, type: !22)
!141 = !DILocation(line: 90, column: 11, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !10, line: 91, type: !25)
!143 = !DILocation(line: 91, column: 9, scope: !139)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !10, line: 92, type: !30)
!145 = !DILocation(line: 92, column: 9, scope: !139)
!146 = !DILocation(line: 93, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !10, line: 93, column: 8)
!148 = !DILocation(line: 93, column: 8, scope: !139)
!149 = !DILocation(line: 96, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !10, line: 94, column: 5)
!151 = !DILocation(line: 96, column: 14, scope: !150)
!152 = !DILocation(line: 97, column: 5, scope: !150)
!153 = !DILocalVariable(name: "source", scope: !154, file: !10, line: 99, type: !30)
!154 = distinct !DILexicalBlock(scope: !139, file: !10, line: 98, column: 5)
!155 = !DILocation(line: 99, column: 13, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !10, line: 101, type: !46)
!157 = distinct !DILexicalBlock(scope: !154, file: !10, line: 100, column: 9)
!158 = !DILocation(line: 101, column: 20, scope: !157)
!159 = !DILocation(line: 103, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !10, line: 103, column: 13)
!161 = !DILocation(line: 103, column: 18, scope: !160)
!162 = !DILocation(line: 103, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !10, line: 103, column: 13)
!164 = !DILocation(line: 103, column: 27, scope: !163)
!165 = !DILocation(line: 103, column: 13, scope: !160)
!166 = !DILocation(line: 105, column: 34, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !10, line: 104, column: 13)
!168 = !DILocation(line: 105, column: 27, scope: !167)
!169 = !DILocation(line: 105, column: 17, scope: !167)
!170 = !DILocation(line: 105, column: 22, scope: !167)
!171 = !DILocation(line: 105, column: 25, scope: !167)
!172 = !DILocation(line: 106, column: 13, scope: !167)
!173 = !DILocation(line: 103, column: 35, scope: !163)
!174 = !DILocation(line: 103, column: 13, scope: !163)
!175 = distinct !{!175, !165, !176, !68}
!176 = !DILocation(line: 106, column: 13, scope: !160)
!177 = !DILocation(line: 107, column: 26, scope: !157)
!178 = !DILocation(line: 107, column: 13, scope: !157)
!179 = !DILocation(line: 110, column: 1, scope: !139)
