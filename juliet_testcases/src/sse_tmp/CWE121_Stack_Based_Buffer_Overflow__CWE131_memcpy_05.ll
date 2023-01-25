; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !28
  %2 = bitcast i8* %1 to i32*, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  %5 = bitcast i32* %4 to i8*, !dbg !40
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !40
  %6 = bitcast i32* %arraydecay to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  %8 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 %8), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i32* null, i32** %data, align 8, !dbg !71
  %0 = load i32, i32* @staticFalse, align 4, !dbg !72
  %tobool = icmp ne i32 %0, 0, !dbg !72
  br i1 %tobool, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  br label %if.end, !dbg !77

if.else:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !78
  %2 = bitcast i8* %1 to i32*, !dbg !80
  store i32* %2, i32** %data, align 8, !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !85
  %5 = bitcast i32* %4 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !86
  %6 = bitcast i32* %arraydecay to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !86
  %7 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !87
  %8 = load i32, i32* %arrayidx, align 4, !dbg !87
  call void @printIntLine(i32 %8), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %0 = load i32, i32* @staticTrue, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !97
  %2 = bitcast i8* %1 to i32*, !dbg !99
  store i32* %2, i32** %data, align 8, !dbg !100
  br label %if.end, !dbg !101

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  %5 = bitcast i32* %4 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !106
  %6 = bitcast i32* %arraydecay to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !106
  %7 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !107
  %8 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 %8), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 24, type: !7, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05_bad", scope: !12, file: !12, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 30, type: !6)
!23 = !DILocation(line: 30, column: 11, scope: !19)
!24 = !DILocation(line: 31, column: 10, scope: !19)
!25 = !DILocation(line: 32, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 8)
!27 = !DILocation(line: 32, column: 8, scope: !19)
!28 = !DILocation(line: 35, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !12, line: 33, column: 5)
!30 = !DILocation(line: 35, column: 16, scope: !29)
!31 = !DILocation(line: 35, column: 14, scope: !29)
!32 = !DILocation(line: 36, column: 5, scope: !29)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !19, file: !12, line: 37, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 38, column: 13, scope: !34)
!39 = !DILocation(line: 40, column: 16, scope: !34)
!40 = !DILocation(line: 40, column: 9, scope: !34)
!41 = !DILocation(line: 41, column: 22, scope: !34)
!42 = !DILocation(line: 41, column: 9, scope: !34)
!43 = !DILocation(line: 43, column: 1, scope: !19)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_05_good", scope: !12, file: !12, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 92, column: 5, scope: !44)
!46 = !DILocation(line: 93, column: 5, scope: !44)
!47 = !DILocation(line: 94, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !49, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 106, type: !7)
!55 = !DILocation(line: 106, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 106, type: !51)
!57 = !DILocation(line: 106, column: 27, scope: !48)
!58 = !DILocation(line: 109, column: 22, scope: !48)
!59 = !DILocation(line: 109, column: 12, scope: !48)
!60 = !DILocation(line: 109, column: 5, scope: !48)
!61 = !DILocation(line: 111, column: 5, scope: !48)
!62 = !DILocation(line: 112, column: 5, scope: !48)
!63 = !DILocation(line: 113, column: 5, scope: !48)
!64 = !DILocation(line: 116, column: 5, scope: !48)
!65 = !DILocation(line: 117, column: 5, scope: !48)
!66 = !DILocation(line: 118, column: 5, scope: !48)
!67 = !DILocation(line: 120, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 52, type: !6)
!70 = !DILocation(line: 52, column: 11, scope: !68)
!71 = !DILocation(line: 53, column: 10, scope: !68)
!72 = !DILocation(line: 54, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !12, line: 54, column: 8)
!74 = !DILocation(line: 54, column: 8, scope: !68)
!75 = !DILocation(line: 57, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !12, line: 55, column: 5)
!77 = !DILocation(line: 58, column: 5, scope: !76)
!78 = !DILocation(line: 62, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !12, line: 60, column: 5)
!80 = !DILocation(line: 62, column: 16, scope: !79)
!81 = !DILocation(line: 62, column: 14, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 65, type: !35)
!83 = distinct !DILexicalBlock(scope: !68, file: !12, line: 64, column: 5)
!84 = !DILocation(line: 65, column: 13, scope: !83)
!85 = !DILocation(line: 67, column: 16, scope: !83)
!86 = !DILocation(line: 67, column: 9, scope: !83)
!87 = !DILocation(line: 68, column: 22, scope: !83)
!88 = !DILocation(line: 68, column: 9, scope: !83)
!89 = !DILocation(line: 70, column: 1, scope: !68)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 75, type: !6)
!92 = !DILocation(line: 75, column: 11, scope: !90)
!93 = !DILocation(line: 76, column: 10, scope: !90)
!94 = !DILocation(line: 77, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !12, line: 77, column: 8)
!96 = !DILocation(line: 77, column: 8, scope: !90)
!97 = !DILocation(line: 80, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 78, column: 5)
!99 = !DILocation(line: 80, column: 16, scope: !98)
!100 = !DILocation(line: 80, column: 14, scope: !98)
!101 = !DILocation(line: 81, column: 5, scope: !98)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 83, type: !35)
!103 = distinct !DILexicalBlock(scope: !90, file: !12, line: 82, column: 5)
!104 = !DILocation(line: 83, column: 13, scope: !103)
!105 = !DILocation(line: 85, column: 16, scope: !103)
!106 = !DILocation(line: 85, column: 9, scope: !103)
!107 = !DILocation(line: 86, column: 22, scope: !103)
!108 = !DILocation(line: 86, column: 9, scope: !103)
!109 = !DILocation(line: 88, column: 1, scope: !90)
