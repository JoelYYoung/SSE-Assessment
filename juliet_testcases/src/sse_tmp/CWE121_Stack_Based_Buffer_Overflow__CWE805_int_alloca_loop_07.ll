; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 200, align 16, !dbg !24
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 400, align 16, !dbg !28
  %3 = bitcast i8* %2 to i32*, !dbg !29
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !27
  %4 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %4, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %5, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !53
  %cmp1 = icmp ult i64 %7, 100, !dbg !55
  br i1 %cmp1, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !59
  %9 = load i32, i32* %arrayidx, align 4, !dbg !59
  %10 = load i32*, i32** %data, align 8, !dbg !60
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !60
  store i32 %9, i32* %arrayidx2, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %12, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !69
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !69
  call void @printIntLine(i32 %14), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07_good() #0 !dbg !72 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07_bad(), !dbg !93
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
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 200, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 400, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  %4 = load i32, i32* @staticFive, align 4, !dbg !107
  %cmp = icmp ne i32 %4, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %5, i32** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !126
  %cmp1 = icmp ult i64 %7, 100, !dbg !128
  br i1 %cmp1, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !132
  %9 = load i32, i32* %arrayidx, align 4, !dbg !132
  %10 = load i32*, i32** %data, align 8, !dbg !133
  %11 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !133
  store i32 %9, i32* %arrayidx2, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %12, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !141
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !141
  call void @printIntLine(i32 %14), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = alloca i8, i64 200, align 16, !dbg !149
  %1 = bitcast i8* %0 to i32*, !dbg !150
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = alloca i8, i64 400, align 16, !dbg !153
  %3 = bitcast i8* %2 to i32*, !dbg !154
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !152
  %4 = load i32, i32* @staticFive, align 4, !dbg !155
  %cmp = icmp eq i32 %4, 5, !dbg !157
  br i1 %cmp, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !159
  store i32* %5, i32** %data, align 8, !dbg !161
  br label %if.end, !dbg !162

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !172
  %cmp1 = icmp ult i64 %7, 100, !dbg !174
  br i1 %cmp1, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !178
  %9 = load i32, i32* %arrayidx, align 4, !dbg !178
  %10 = load i32*, i32** %data, align 8, !dbg !179
  %11 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !179
  store i32 %9, i32* %arrayidx2, align 4, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %12, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !187
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !187
  call void @printIntLine(i32 %14), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07_bad", scope: !10, file: !10, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !17, file: !10, line: 29, type: !6)
!21 = !DILocation(line: 29, column: 11, scope: !17)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !10, line: 30, type: !6)
!23 = !DILocation(line: 30, column: 11, scope: !17)
!24 = !DILocation(line: 30, column: 34, scope: !17)
!25 = !DILocation(line: 30, column: 27, scope: !17)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !10, line: 31, type: !6)
!27 = !DILocation(line: 31, column: 11, scope: !17)
!28 = !DILocation(line: 31, column: 35, scope: !17)
!29 = !DILocation(line: 31, column: 28, scope: !17)
!30 = !DILocation(line: 32, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !17, file: !10, line: 32, column: 8)
!32 = !DILocation(line: 32, column: 18, scope: !31)
!33 = !DILocation(line: 32, column: 8, scope: !17)
!34 = !DILocation(line: 36, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 33, column: 5)
!36 = !DILocation(line: 36, column: 14, scope: !35)
!37 = !DILocation(line: 37, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !10, line: 39, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !10, line: 38, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 39, column: 13, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !10, line: 41, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !10, line: 40, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 41, column: 20, scope: !45)
!50 = !DILocation(line: 43, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !10, line: 43, column: 13)
!52 = !DILocation(line: 43, column: 18, scope: !51)
!53 = !DILocation(line: 43, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !10, line: 43, column: 13)
!55 = !DILocation(line: 43, column: 27, scope: !54)
!56 = !DILocation(line: 43, column: 13, scope: !51)
!57 = !DILocation(line: 45, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !10, line: 44, column: 13)
!59 = !DILocation(line: 45, column: 27, scope: !58)
!60 = !DILocation(line: 45, column: 17, scope: !58)
!61 = !DILocation(line: 45, column: 22, scope: !58)
!62 = !DILocation(line: 45, column: 25, scope: !58)
!63 = !DILocation(line: 46, column: 13, scope: !58)
!64 = !DILocation(line: 43, column: 35, scope: !54)
!65 = !DILocation(line: 43, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 46, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 47, column: 26, scope: !45)
!70 = !DILocation(line: 47, column: 13, scope: !45)
!71 = !DILocation(line: 50, column: 1, scope: !17)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_07_good", scope: !10, file: !10, line: 111, type: !18, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 113, column: 5, scope: !72)
!74 = !DILocation(line: 114, column: 5, scope: !72)
!75 = !DILocation(line: 115, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 127, type: !77, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!7, !7, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !10, line: 127, type: !7)
!83 = !DILocation(line: 127, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !10, line: 127, type: !79)
!85 = !DILocation(line: 127, column: 27, scope: !76)
!86 = !DILocation(line: 130, column: 22, scope: !76)
!87 = !DILocation(line: 130, column: 12, scope: !76)
!88 = !DILocation(line: 130, column: 5, scope: !76)
!89 = !DILocation(line: 132, column: 5, scope: !76)
!90 = !DILocation(line: 133, column: 5, scope: !76)
!91 = !DILocation(line: 134, column: 5, scope: !76)
!92 = !DILocation(line: 137, column: 5, scope: !76)
!93 = !DILocation(line: 138, column: 5, scope: !76)
!94 = !DILocation(line: 139, column: 5, scope: !76)
!95 = !DILocation(line: 141, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 59, type: !6)
!98 = !DILocation(line: 59, column: 11, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !10, line: 60, type: !6)
!100 = !DILocation(line: 60, column: 11, scope: !96)
!101 = !DILocation(line: 60, column: 34, scope: !96)
!102 = !DILocation(line: 60, column: 27, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !10, line: 61, type: !6)
!104 = !DILocation(line: 61, column: 11, scope: !96)
!105 = !DILocation(line: 61, column: 35, scope: !96)
!106 = !DILocation(line: 61, column: 28, scope: !96)
!107 = !DILocation(line: 62, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !10, line: 62, column: 8)
!109 = !DILocation(line: 62, column: 18, scope: !108)
!110 = !DILocation(line: 62, column: 8, scope: !96)
!111 = !DILocation(line: 65, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !10, line: 63, column: 5)
!113 = !DILocation(line: 66, column: 5, scope: !112)
!114 = !DILocation(line: 70, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !10, line: 68, column: 5)
!116 = !DILocation(line: 70, column: 14, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !118, file: !10, line: 73, type: !40)
!118 = distinct !DILexicalBlock(scope: !96, file: !10, line: 72, column: 5)
!119 = !DILocation(line: 73, column: 13, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !10, line: 75, type: !46)
!121 = distinct !DILexicalBlock(scope: !118, file: !10, line: 74, column: 9)
!122 = !DILocation(line: 75, column: 20, scope: !121)
!123 = !DILocation(line: 77, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 77, column: 13)
!125 = !DILocation(line: 77, column: 18, scope: !124)
!126 = !DILocation(line: 77, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 77, column: 13)
!128 = !DILocation(line: 77, column: 27, scope: !127)
!129 = !DILocation(line: 77, column: 13, scope: !124)
!130 = !DILocation(line: 79, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !10, line: 78, column: 13)
!132 = !DILocation(line: 79, column: 27, scope: !131)
!133 = !DILocation(line: 79, column: 17, scope: !131)
!134 = !DILocation(line: 79, column: 22, scope: !131)
!135 = !DILocation(line: 79, column: 25, scope: !131)
!136 = !DILocation(line: 80, column: 13, scope: !131)
!137 = !DILocation(line: 77, column: 35, scope: !127)
!138 = !DILocation(line: 77, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 80, column: 13, scope: !124)
!141 = !DILocation(line: 81, column: 26, scope: !121)
!142 = !DILocation(line: 81, column: 13, scope: !121)
!143 = !DILocation(line: 84, column: 1, scope: !96)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 87, type: !18, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", scope: !144, file: !10, line: 89, type: !6)
!146 = !DILocation(line: 89, column: 11, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !10, line: 90, type: !6)
!148 = !DILocation(line: 90, column: 11, scope: !144)
!149 = !DILocation(line: 90, column: 34, scope: !144)
!150 = !DILocation(line: 90, column: 27, scope: !144)
!151 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !10, line: 91, type: !6)
!152 = !DILocation(line: 91, column: 11, scope: !144)
!153 = !DILocation(line: 91, column: 35, scope: !144)
!154 = !DILocation(line: 91, column: 28, scope: !144)
!155 = !DILocation(line: 92, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !144, file: !10, line: 92, column: 8)
!157 = !DILocation(line: 92, column: 18, scope: !156)
!158 = !DILocation(line: 92, column: 8, scope: !144)
!159 = !DILocation(line: 95, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !10, line: 93, column: 5)
!161 = !DILocation(line: 95, column: 14, scope: !160)
!162 = !DILocation(line: 96, column: 5, scope: !160)
!163 = !DILocalVariable(name: "source", scope: !164, file: !10, line: 98, type: !40)
!164 = distinct !DILexicalBlock(scope: !144, file: !10, line: 97, column: 5)
!165 = !DILocation(line: 98, column: 13, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !167, file: !10, line: 100, type: !46)
!167 = distinct !DILexicalBlock(scope: !164, file: !10, line: 99, column: 9)
!168 = !DILocation(line: 100, column: 20, scope: !167)
!169 = !DILocation(line: 102, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !10, line: 102, column: 13)
!171 = !DILocation(line: 102, column: 18, scope: !170)
!172 = !DILocation(line: 102, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !10, line: 102, column: 13)
!174 = !DILocation(line: 102, column: 27, scope: !173)
!175 = !DILocation(line: 102, column: 13, scope: !170)
!176 = !DILocation(line: 104, column: 34, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !10, line: 103, column: 13)
!178 = !DILocation(line: 104, column: 27, scope: !177)
!179 = !DILocation(line: 104, column: 17, scope: !177)
!180 = !DILocation(line: 104, column: 22, scope: !177)
!181 = !DILocation(line: 104, column: 25, scope: !177)
!182 = !DILocation(line: 105, column: 13, scope: !177)
!183 = !DILocation(line: 102, column: 35, scope: !173)
!184 = !DILocation(line: 102, column: 13, scope: !173)
!185 = distinct !{!185, !175, !186, !68}
!186 = !DILocation(line: 105, column: 13, scope: !170)
!187 = !DILocation(line: 106, column: 26, scope: !167)
!188 = !DILocation(line: 106, column: 13, scope: !167)
!189 = !DILocation(line: 109, column: 1, scope: !144)
