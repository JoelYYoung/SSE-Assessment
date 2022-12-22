; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = load i32, i32* @globalFive, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 5, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !24
  %2 = bitcast i8* %1 to i32*, !dbg !26
  store i32* %2, i32** %data, align 8, !dbg !27
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !34
  %4 = load i32*, i32** %data, align 8, !dbg !35
  %5 = bitcast i32* %4 to i8*, !dbg !36
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !36
  %6 = bitcast i32* %arraydecay to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !36
  %7 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !37
  %8 = load i32, i32* %arrayidx, align 4, !dbg !37
  call void @printIntLine(i32 %8), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  %0 = load i32, i32* @globalFive, align 4, !dbg !68
  %cmp = icmp ne i32 %0, 5, !dbg !70
  br i1 %cmp, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  br label %if.end, !dbg !74

if.else:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !75
  %2 = bitcast i8* %1 to i32*, !dbg !77
  store i32* %2, i32** %data, align 8, !dbg !78
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !81
  %4 = load i32*, i32** %data, align 8, !dbg !82
  %5 = bitcast i32* %4 to i8*, !dbg !83
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !83
  %6 = bitcast i32* %arraydecay to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !83
  %7 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !84
  %8 = load i32, i32* %arrayidx, align 4, !dbg !84
  call void @printIntLine(i32 %8), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @globalFive, align 4, !dbg !91
  %cmp = icmp eq i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !95
  %2 = bitcast i8* %1 to i32*, !dbg !97
  store i32* %2, i32** %data, align 8, !dbg !98
  br label %if.end, !dbg !99

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %5 = bitcast i32* %4 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !104
  %6 = bitcast i32* %arraydecay to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !105
  %8 = load i32, i32* %arrayidx, align 4, !dbg !105
  call void @printIntLine(i32 %8), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 8)
!22 = !DILocation(line: 25, column: 18, scope: !21)
!23 = !DILocation(line: 25, column: 8, scope: !13)
!24 = !DILocation(line: 28, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !14, line: 26, column: 5)
!26 = !DILocation(line: 28, column: 16, scope: !25)
!27 = !DILocation(line: 28, column: 14, scope: !25)
!28 = !DILocation(line: 29, column: 5, scope: !25)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 31, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 31, column: 13, scope: !30)
!35 = !DILocation(line: 33, column: 16, scope: !30)
!36 = !DILocation(line: 33, column: 9, scope: !30)
!37 = !DILocation(line: 34, column: 22, scope: !30)
!38 = !DILocation(line: 34, column: 9, scope: !30)
!39 = !DILocation(line: 36, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_14_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 85, column: 5, scope: !40)
!42 = !DILocation(line: 86, column: 5, scope: !40)
!43 = !DILocation(line: 87, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !45, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!5, !5, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 99, type: !5)
!51 = !DILocation(line: 99, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 99, type: !47)
!53 = !DILocation(line: 99, column: 27, scope: !44)
!54 = !DILocation(line: 102, column: 22, scope: !44)
!55 = !DILocation(line: 102, column: 12, scope: !44)
!56 = !DILocation(line: 102, column: 5, scope: !44)
!57 = !DILocation(line: 104, column: 5, scope: !44)
!58 = !DILocation(line: 105, column: 5, scope: !44)
!59 = !DILocation(line: 106, column: 5, scope: !44)
!60 = !DILocation(line: 109, column: 5, scope: !44)
!61 = !DILocation(line: 110, column: 5, scope: !44)
!62 = !DILocation(line: 111, column: 5, scope: !44)
!63 = !DILocation(line: 113, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 43, type: !15, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 45, type: !4)
!66 = !DILocation(line: 45, column: 11, scope: !64)
!67 = !DILocation(line: 46, column: 10, scope: !64)
!68 = !DILocation(line: 47, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !14, line: 47, column: 8)
!70 = !DILocation(line: 47, column: 18, scope: !69)
!71 = !DILocation(line: 47, column: 8, scope: !64)
!72 = !DILocation(line: 50, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !14, line: 48, column: 5)
!74 = !DILocation(line: 51, column: 5, scope: !73)
!75 = !DILocation(line: 55, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !14, line: 53, column: 5)
!77 = !DILocation(line: 55, column: 16, scope: !76)
!78 = !DILocation(line: 55, column: 14, scope: !76)
!79 = !DILocalVariable(name: "source", scope: !80, file: !14, line: 58, type: !31)
!80 = distinct !DILexicalBlock(scope: !64, file: !14, line: 57, column: 5)
!81 = !DILocation(line: 58, column: 13, scope: !80)
!82 = !DILocation(line: 60, column: 16, scope: !80)
!83 = !DILocation(line: 60, column: 9, scope: !80)
!84 = !DILocation(line: 61, column: 22, scope: !80)
!85 = !DILocation(line: 61, column: 9, scope: !80)
!86 = !DILocation(line: 63, column: 1, scope: !64)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 66, type: !15, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 68, type: !4)
!89 = !DILocation(line: 68, column: 11, scope: !87)
!90 = !DILocation(line: 69, column: 10, scope: !87)
!91 = !DILocation(line: 70, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !14, line: 70, column: 8)
!93 = !DILocation(line: 70, column: 18, scope: !92)
!94 = !DILocation(line: 70, column: 8, scope: !87)
!95 = !DILocation(line: 73, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !14, line: 71, column: 5)
!97 = !DILocation(line: 73, column: 16, scope: !96)
!98 = !DILocation(line: 73, column: 14, scope: !96)
!99 = !DILocation(line: 74, column: 5, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !14, line: 76, type: !31)
!101 = distinct !DILexicalBlock(scope: !87, file: !14, line: 75, column: 5)
!102 = !DILocation(line: 76, column: 13, scope: !101)
!103 = !DILocation(line: 78, column: 16, scope: !101)
!104 = !DILocation(line: 78, column: 9, scope: !101)
!105 = !DILocation(line: 79, column: 22, scope: !101)
!106 = !DILocation(line: 79, column: 9, scope: !101)
!107 = !DILocation(line: 81, column: 1, scope: !87)
