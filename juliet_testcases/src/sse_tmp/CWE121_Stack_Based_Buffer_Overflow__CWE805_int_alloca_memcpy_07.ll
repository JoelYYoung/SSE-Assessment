; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
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
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %8 = bitcast i32* %7 to i8*, !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %9 = bitcast i32* %arraydecay to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !45
  %10 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !46
  %11 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 %11), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 200, align 16, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = alloca i8, i64 400, align 16, !dbg !82
  %3 = bitcast i8* %2 to i32*, !dbg !83
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !81
  %4 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %4, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !91
  store i32* %5, i32** %data, align 8, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !96
  %7 = load i32*, i32** %data, align 8, !dbg !97
  %8 = bitcast i32* %7 to i8*, !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %9 = bitcast i32* %arraydecay to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !98
  %10 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !99
  %11 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %11), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 200, align 16, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %2 = alloca i8, i64 400, align 16, !dbg !111
  %3 = bitcast i8* %2 to i32*, !dbg !112
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !110
  %4 = load i32, i32* @staticFive, align 4, !dbg !113
  %cmp = icmp eq i32 %4, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %5, i32** %data, align 8, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !123
  %7 = load i32*, i32** %data, align 8, !dbg !124
  %8 = bitcast i32* %7 to i8*, !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %9 = bitcast i32* %arraydecay to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !125
  %10 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !126
  %11 = load i32, i32* %arrayidx, align 4, !dbg !126
  call void @printIntLine(i32 %11), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07_bad", scope: !10, file: !10, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!44 = !DILocation(line: 41, column: 16, scope: !39)
!45 = !DILocation(line: 41, column: 9, scope: !39)
!46 = !DILocation(line: 42, column: 22, scope: !39)
!47 = !DILocation(line: 42, column: 9, scope: !39)
!48 = !DILocation(line: 44, column: 1, scope: !17)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_07_good", scope: !10, file: !10, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 95, column: 5, scope: !49)
!51 = !DILocation(line: 96, column: 5, scope: !49)
!52 = !DILocation(line: 97, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 109, type: !54, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !10, line: 109, type: !7)
!60 = !DILocation(line: 109, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !10, line: 109, type: !56)
!62 = !DILocation(line: 109, column: 27, scope: !53)
!63 = !DILocation(line: 112, column: 22, scope: !53)
!64 = !DILocation(line: 112, column: 12, scope: !53)
!65 = !DILocation(line: 112, column: 5, scope: !53)
!66 = !DILocation(line: 114, column: 5, scope: !53)
!67 = !DILocation(line: 115, column: 5, scope: !53)
!68 = !DILocation(line: 116, column: 5, scope: !53)
!69 = !DILocation(line: 119, column: 5, scope: !53)
!70 = !DILocation(line: 120, column: 5, scope: !53)
!71 = !DILocation(line: 121, column: 5, scope: !53)
!72 = !DILocation(line: 123, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !10, line: 53, type: !6)
!75 = !DILocation(line: 53, column: 11, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !10, line: 54, type: !6)
!77 = !DILocation(line: 54, column: 11, scope: !73)
!78 = !DILocation(line: 54, column: 34, scope: !73)
!79 = !DILocation(line: 54, column: 27, scope: !73)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !10, line: 55, type: !6)
!81 = !DILocation(line: 55, column: 11, scope: !73)
!82 = !DILocation(line: 55, column: 35, scope: !73)
!83 = !DILocation(line: 55, column: 28, scope: !73)
!84 = !DILocation(line: 56, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !10, line: 56, column: 8)
!86 = !DILocation(line: 56, column: 18, scope: !85)
!87 = !DILocation(line: 56, column: 8, scope: !73)
!88 = !DILocation(line: 59, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !10, line: 57, column: 5)
!90 = !DILocation(line: 60, column: 5, scope: !89)
!91 = !DILocation(line: 64, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !10, line: 62, column: 5)
!93 = !DILocation(line: 64, column: 14, scope: !92)
!94 = !DILocalVariable(name: "source", scope: !95, file: !10, line: 67, type: !40)
!95 = distinct !DILexicalBlock(scope: !73, file: !10, line: 66, column: 5)
!96 = !DILocation(line: 67, column: 13, scope: !95)
!97 = !DILocation(line: 69, column: 16, scope: !95)
!98 = !DILocation(line: 69, column: 9, scope: !95)
!99 = !DILocation(line: 70, column: 22, scope: !95)
!100 = !DILocation(line: 70, column: 9, scope: !95)
!101 = !DILocation(line: 72, column: 1, scope: !73)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 75, type: !18, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !10, line: 77, type: !6)
!104 = !DILocation(line: 77, column: 11, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !10, line: 78, type: !6)
!106 = !DILocation(line: 78, column: 11, scope: !102)
!107 = !DILocation(line: 78, column: 34, scope: !102)
!108 = !DILocation(line: 78, column: 27, scope: !102)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !10, line: 79, type: !6)
!110 = !DILocation(line: 79, column: 11, scope: !102)
!111 = !DILocation(line: 79, column: 35, scope: !102)
!112 = !DILocation(line: 79, column: 28, scope: !102)
!113 = !DILocation(line: 80, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !10, line: 80, column: 8)
!115 = !DILocation(line: 80, column: 18, scope: !114)
!116 = !DILocation(line: 80, column: 8, scope: !102)
!117 = !DILocation(line: 83, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !10, line: 81, column: 5)
!119 = !DILocation(line: 83, column: 14, scope: !118)
!120 = !DILocation(line: 84, column: 5, scope: !118)
!121 = !DILocalVariable(name: "source", scope: !122, file: !10, line: 86, type: !40)
!122 = distinct !DILexicalBlock(scope: !102, file: !10, line: 85, column: 5)
!123 = !DILocation(line: 86, column: 13, scope: !122)
!124 = !DILocation(line: 88, column: 16, scope: !122)
!125 = !DILocation(line: 88, column: 9, scope: !122)
!126 = !DILocation(line: 89, column: 22, scope: !122)
!127 = !DILocation(line: 89, column: 9, scope: !122)
!128 = !DILocation(line: 91, column: 1, scope: !102)
