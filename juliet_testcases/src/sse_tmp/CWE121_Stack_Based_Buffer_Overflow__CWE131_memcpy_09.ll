; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !20
  %tobool = icmp ne i32 %0, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !23
  %2 = bitcast i8* %1 to i32*, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %5 = bitcast i32* %4 to i8*, !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !35
  %6 = bitcast i32* %arraydecay to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !35
  %7 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !36
  %8 = load i32, i32* %arrayidx, align 4, !dbg !36
  call void @printIntLine(i32 %8), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09_good() #0 !dbg !39 {
entry:
  call void @goodG2B1(), !dbg !40
  call void @goodG2B2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i32* null, i32** %data, align 8, !dbg !66
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !67
  %tobool = icmp ne i32 %0, 0, !dbg !67
  br i1 %tobool, label %if.then, label %if.else, !dbg !69

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  br label %if.end, !dbg !72

if.else:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !73
  %2 = bitcast i8* %1 to i32*, !dbg !75
  store i32* %2, i32** %data, align 8, !dbg !76
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !79
  %4 = load i32*, i32** %data, align 8, !dbg !80
  %5 = bitcast i32* %4 to i8*, !dbg !81
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !81
  %6 = bitcast i32* %arraydecay to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !81
  %7 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !82
  %8 = load i32, i32* %arrayidx, align 4, !dbg !82
  call void @printIntLine(i32 %8), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !92
  %2 = bitcast i8* %1 to i32*, !dbg !94
  store i32* %2, i32** %data, align 8, !dbg !95
  br label %if.end, !dbg !96

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %5 = bitcast i32* %4 to i8*, !dbg !101
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !101
  %6 = bitcast i32* %arraydecay to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !102
  %8 = load i32, i32* %arrayidx, align 4, !dbg !102
  call void @printIntLine(i32 %8), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 8)
!22 = !DILocation(line: 25, column: 8, scope: !13)
!23 = !DILocation(line: 28, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !14, line: 26, column: 5)
!25 = !DILocation(line: 28, column: 16, scope: !24)
!26 = !DILocation(line: 28, column: 14, scope: !24)
!27 = !DILocation(line: 29, column: 5, scope: !24)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 31, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 31, column: 13, scope: !29)
!34 = !DILocation(line: 33, column: 16, scope: !29)
!35 = !DILocation(line: 33, column: 9, scope: !29)
!36 = !DILocation(line: 34, column: 22, scope: !29)
!37 = !DILocation(line: 34, column: 9, scope: !29)
!38 = !DILocation(line: 36, column: 1, scope: !13)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_09_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 85, column: 5, scope: !39)
!41 = !DILocation(line: 86, column: 5, scope: !39)
!42 = !DILocation(line: 87, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !44, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!5, !5, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 99, type: !5)
!50 = !DILocation(line: 99, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 99, type: !46)
!52 = !DILocation(line: 99, column: 27, scope: !43)
!53 = !DILocation(line: 102, column: 22, scope: !43)
!54 = !DILocation(line: 102, column: 12, scope: !43)
!55 = !DILocation(line: 102, column: 5, scope: !43)
!56 = !DILocation(line: 104, column: 5, scope: !43)
!57 = !DILocation(line: 105, column: 5, scope: !43)
!58 = !DILocation(line: 106, column: 5, scope: !43)
!59 = !DILocation(line: 109, column: 5, scope: !43)
!60 = !DILocation(line: 110, column: 5, scope: !43)
!61 = !DILocation(line: 111, column: 5, scope: !43)
!62 = !DILocation(line: 113, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 43, type: !15, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 45, type: !4)
!65 = !DILocation(line: 45, column: 11, scope: !63)
!66 = !DILocation(line: 46, column: 10, scope: !63)
!67 = !DILocation(line: 47, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !14, line: 47, column: 8)
!69 = !DILocation(line: 47, column: 8, scope: !63)
!70 = !DILocation(line: 50, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !14, line: 48, column: 5)
!72 = !DILocation(line: 51, column: 5, scope: !71)
!73 = !DILocation(line: 55, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !14, line: 53, column: 5)
!75 = !DILocation(line: 55, column: 16, scope: !74)
!76 = !DILocation(line: 55, column: 14, scope: !74)
!77 = !DILocalVariable(name: "source", scope: !78, file: !14, line: 58, type: !30)
!78 = distinct !DILexicalBlock(scope: !63, file: !14, line: 57, column: 5)
!79 = !DILocation(line: 58, column: 13, scope: !78)
!80 = !DILocation(line: 60, column: 16, scope: !78)
!81 = !DILocation(line: 60, column: 9, scope: !78)
!82 = !DILocation(line: 61, column: 22, scope: !78)
!83 = !DILocation(line: 61, column: 9, scope: !78)
!84 = !DILocation(line: 63, column: 1, scope: !63)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 66, type: !15, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 68, type: !4)
!87 = !DILocation(line: 68, column: 11, scope: !85)
!88 = !DILocation(line: 69, column: 10, scope: !85)
!89 = !DILocation(line: 70, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !14, line: 70, column: 8)
!91 = !DILocation(line: 70, column: 8, scope: !85)
!92 = !DILocation(line: 73, column: 23, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !14, line: 71, column: 5)
!94 = !DILocation(line: 73, column: 16, scope: !93)
!95 = !DILocation(line: 73, column: 14, scope: !93)
!96 = !DILocation(line: 74, column: 5, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !14, line: 76, type: !30)
!98 = distinct !DILexicalBlock(scope: !85, file: !14, line: 75, column: 5)
!99 = !DILocation(line: 76, column: 13, scope: !98)
!100 = !DILocation(line: 78, column: 16, scope: !98)
!101 = !DILocation(line: 78, column: 9, scope: !98)
!102 = !DILocation(line: 79, column: 22, scope: !98)
!103 = !DILocation(line: 79, column: 9, scope: !98)
!104 = !DILocation(line: 81, column: 1, scope: !85)
