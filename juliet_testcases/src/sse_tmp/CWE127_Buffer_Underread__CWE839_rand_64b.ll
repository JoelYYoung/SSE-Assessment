; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_64b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_64b_badSink(i8* %dataVoidPtr) #0 !dbg !12 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataPtr, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !25
  %3 = load i32, i32* %2, align 4, !dbg !26
  store i32 %3, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !27, metadata !DIExpression()), !dbg !32
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !32
  %5 = load i32, i32* %data, align 4, !dbg !33
  %cmp = icmp slt i32 %5, 10, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %data, align 4, !dbg !37
  %idxprom = sext i32 %6 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  %7 = load i32, i32* %arrayidx, align 4, !dbg !39
  call void @printIntLine(i32 %7), !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !45 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !50
  %1 = bitcast i8* %0 to i32*, !dbg !51
  store i32* %1, i32** %dataPtr, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %data, metadata !52, metadata !DIExpression()), !dbg !53
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !54
  %3 = load i32, i32* %2, align 4, !dbg !55
  store i32 %3, i32* %data, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !56, metadata !DIExpression()), !dbg !58
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !58
  %5 = load i32, i32* %data, align 4, !dbg !59
  %cmp = icmp slt i32 %5, 10, !dbg !61
  br i1 %cmp, label %if.then, label %if.else, !dbg !62

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %data, align 4, !dbg !63
  %idxprom = sext i32 %6 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !65
  %7 = load i32, i32* %arrayidx, align 4, !dbg !65
  call void @printIntLine(i32 %7), !dbg !66
  br label %if.end, !dbg !67

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !68
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_64b_goodB2GSink(i8* %dataVoidPtr) #0 !dbg !71 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataPtr, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !80
  %3 = load i32, i32* %2, align 4, !dbg !81
  store i32 %3, i32* %data, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !82, metadata !DIExpression()), !dbg !84
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !84
  %5 = load i32, i32* %data, align 4, !dbg !85
  %cmp = icmp sge i32 %5, 0, !dbg !87
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !88

land.lhs.true:                                    ; preds = %entry
  %6 = load i32, i32* %data, align 4, !dbg !89
  %cmp1 = icmp slt i32 %6, 10, !dbg !90
  br i1 %cmp1, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !92
  %idxprom = sext i32 %7 to i64, !dbg !94
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !94
  %8 = load i32, i32* %arrayidx, align 4, !dbg !94
  call void @printIntLine(i32 %8), !dbg !95
  br label %if.end, !dbg !96

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_64b_badSink", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_64b.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !12, file: !13, line: 22, type: !16)
!18 = !DILocation(line: 22, column: 62, scope: !12)
!19 = !DILocalVariable(name: "dataPtr", scope: !12, file: !13, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 11, scope: !12)
!21 = !DILocation(line: 25, column: 28, scope: !12)
!22 = !DILocation(line: 25, column: 21, scope: !12)
!23 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 27, type: !5)
!24 = !DILocation(line: 27, column: 9, scope: !12)
!25 = !DILocation(line: 27, column: 18, scope: !12)
!26 = !DILocation(line: 27, column: 17, scope: !12)
!27 = !DILocalVariable(name: "buffer", scope: !28, file: !13, line: 29, type: !29)
!28 = distinct !DILexicalBlock(scope: !12, file: !13, line: 28, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 29, column: 13, scope: !28)
!33 = !DILocation(line: 32, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 32, column: 13)
!35 = !DILocation(line: 32, column: 18, scope: !34)
!36 = !DILocation(line: 32, column: 13, scope: !28)
!37 = !DILocation(line: 34, column: 33, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 33, column: 9)
!39 = !DILocation(line: 34, column: 26, scope: !38)
!40 = !DILocation(line: 34, column: 13, scope: !38)
!41 = !DILocation(line: 35, column: 9, scope: !38)
!42 = !DILocation(line: 38, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !13, line: 37, column: 9)
!44 = !DILocation(line: 41, column: 1, scope: !12)
!45 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_64b_goodG2BSink", scope: !13, file: !13, line: 48, type: !14, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !45, file: !13, line: 48, type: !16)
!47 = !DILocation(line: 48, column: 66, scope: !45)
!48 = !DILocalVariable(name: "dataPtr", scope: !45, file: !13, line: 51, type: !4)
!49 = !DILocation(line: 51, column: 11, scope: !45)
!50 = !DILocation(line: 51, column: 28, scope: !45)
!51 = !DILocation(line: 51, column: 21, scope: !45)
!52 = !DILocalVariable(name: "data", scope: !45, file: !13, line: 53, type: !5)
!53 = !DILocation(line: 53, column: 9, scope: !45)
!54 = !DILocation(line: 53, column: 18, scope: !45)
!55 = !DILocation(line: 53, column: 17, scope: !45)
!56 = !DILocalVariable(name: "buffer", scope: !57, file: !13, line: 55, type: !29)
!57 = distinct !DILexicalBlock(scope: !45, file: !13, line: 54, column: 5)
!58 = !DILocation(line: 55, column: 13, scope: !57)
!59 = !DILocation(line: 58, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 58, column: 13)
!61 = !DILocation(line: 58, column: 18, scope: !60)
!62 = !DILocation(line: 58, column: 13, scope: !57)
!63 = !DILocation(line: 60, column: 33, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 59, column: 9)
!65 = !DILocation(line: 60, column: 26, scope: !64)
!66 = !DILocation(line: 60, column: 13, scope: !64)
!67 = !DILocation(line: 61, column: 9, scope: !64)
!68 = !DILocation(line: 64, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !60, file: !13, line: 63, column: 9)
!70 = !DILocation(line: 67, column: 1, scope: !45)
!71 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_64b_goodB2GSink", scope: !13, file: !13, line: 70, type: !14, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !71, file: !13, line: 70, type: !16)
!73 = !DILocation(line: 70, column: 66, scope: !71)
!74 = !DILocalVariable(name: "dataPtr", scope: !71, file: !13, line: 73, type: !4)
!75 = !DILocation(line: 73, column: 11, scope: !71)
!76 = !DILocation(line: 73, column: 28, scope: !71)
!77 = !DILocation(line: 73, column: 21, scope: !71)
!78 = !DILocalVariable(name: "data", scope: !71, file: !13, line: 75, type: !5)
!79 = !DILocation(line: 75, column: 9, scope: !71)
!80 = !DILocation(line: 75, column: 18, scope: !71)
!81 = !DILocation(line: 75, column: 17, scope: !71)
!82 = !DILocalVariable(name: "buffer", scope: !83, file: !13, line: 77, type: !29)
!83 = distinct !DILexicalBlock(scope: !71, file: !13, line: 76, column: 5)
!84 = !DILocation(line: 77, column: 13, scope: !83)
!85 = !DILocation(line: 79, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !13, line: 79, column: 13)
!87 = !DILocation(line: 79, column: 18, scope: !86)
!88 = !DILocation(line: 79, column: 23, scope: !86)
!89 = !DILocation(line: 79, column: 26, scope: !86)
!90 = !DILocation(line: 79, column: 31, scope: !86)
!91 = !DILocation(line: 79, column: 13, scope: !83)
!92 = !DILocation(line: 81, column: 33, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !13, line: 80, column: 9)
!94 = !DILocation(line: 81, column: 26, scope: !93)
!95 = !DILocation(line: 81, column: 13, scope: !93)
!96 = !DILocation(line: 82, column: 9, scope: !93)
!97 = !DILocation(line: 85, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !86, file: !13, line: 84, column: 9)
!99 = !DILocation(line: 88, column: 1, scope: !71)
