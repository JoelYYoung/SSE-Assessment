; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_66b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_66b_badSink(i32* %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataArray, i32** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataArray.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** %dataArray.addr, align 8, !dbg !19
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !19
  %1 = load i32, i32* %arrayidx, align 4, !dbg !19
  store i32 %1, i32* %data, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !20, metadata !DIExpression()), !dbg !25
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !25
  %3 = load i32, i32* %data, align 4, !dbg !26
  %cmp = icmp sge i32 %3, 0, !dbg !28
  br i1 %cmp, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !30
  %idxprom = sext i32 %4 to i64, !dbg !32
  %arrayidx1 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !32
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !32
  call void @printIntLine(i32 %5), !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !35
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_66b_goodG2BSink(i32* %dataArray) #0 !dbg !38 {
entry:
  %dataArray.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataArray, i32** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataArray.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %data, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i32*, i32** %dataArray.addr, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !43
  %1 = load i32, i32* %arrayidx, align 4, !dbg !43
  store i32 %1, i32* %data, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !46
  %3 = load i32, i32* %data, align 4, !dbg !47
  %cmp = icmp sge i32 %3, 0, !dbg !49
  br i1 %cmp, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !51
  %idxprom = sext i32 %4 to i64, !dbg !53
  %arrayidx1 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !53
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !53
  call void @printIntLine(i32 %5), !dbg !54
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_66b_goodB2GSink(i32* %dataArray) #0 !dbg !59 {
entry:
  %dataArray.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataArray, i32** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataArray.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i32*, i32** %dataArray.addr, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !64
  %1 = load i32, i32* %arrayidx, align 4, !dbg !64
  store i32 %1, i32* %data, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !65, metadata !DIExpression()), !dbg !67
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !67
  %3 = load i32, i32* %data, align 4, !dbg !68
  %cmp = icmp sge i32 %3, 0, !dbg !70
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !71

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !72
  %cmp1 = icmp slt i32 %4, 10, !dbg !73
  br i1 %cmp1, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !75
  %idxprom = sext i32 %5 to i64, !dbg !77
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !77
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !77
  call void @printIntLine(i32 %6), !dbg !78
  br label %if.end, !dbg !79

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !82
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_66b_badSink", scope: !10, file: !10, line: 22, type: !11, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 22, type: !13)
!16 = !DILocation(line: 22, column: 60, scope: !9)
!17 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!18 = !DILocation(line: 25, column: 9, scope: !9)
!19 = !DILocation(line: 25, column: 16, scope: !9)
!20 = !DILocalVariable(name: "buffer", scope: !21, file: !10, line: 27, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 27, column: 13, scope: !21)
!26 = !DILocation(line: 30, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !10, line: 30, column: 13)
!28 = !DILocation(line: 30, column: 18, scope: !27)
!29 = !DILocation(line: 30, column: 13, scope: !21)
!30 = !DILocation(line: 32, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 31, column: 9)
!32 = !DILocation(line: 32, column: 26, scope: !31)
!33 = !DILocation(line: 32, column: 13, scope: !31)
!34 = !DILocation(line: 33, column: 9, scope: !31)
!35 = !DILocation(line: 36, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !10, line: 35, column: 9)
!37 = !DILocation(line: 39, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_66b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "dataArray", arg: 1, scope: !38, file: !10, line: 46, type: !13)
!40 = !DILocation(line: 46, column: 64, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !10, line: 48, type: !14)
!42 = !DILocation(line: 48, column: 9, scope: !38)
!43 = !DILocation(line: 48, column: 16, scope: !38)
!44 = !DILocalVariable(name: "buffer", scope: !45, file: !10, line: 50, type: !22)
!45 = distinct !DILexicalBlock(scope: !38, file: !10, line: 49, column: 5)
!46 = !DILocation(line: 50, column: 13, scope: !45)
!47 = !DILocation(line: 53, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !10, line: 53, column: 13)
!49 = !DILocation(line: 53, column: 18, scope: !48)
!50 = !DILocation(line: 53, column: 13, scope: !45)
!51 = !DILocation(line: 55, column: 33, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 54, column: 9)
!53 = !DILocation(line: 55, column: 26, scope: !52)
!54 = !DILocation(line: 55, column: 13, scope: !52)
!55 = !DILocation(line: 56, column: 9, scope: !52)
!56 = !DILocation(line: 59, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !10, line: 58, column: 9)
!58 = !DILocation(line: 62, column: 1, scope: !38)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_66b_goodB2GSink", scope: !10, file: !10, line: 65, type: !11, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "dataArray", arg: 1, scope: !59, file: !10, line: 65, type: !13)
!61 = !DILocation(line: 65, column: 64, scope: !59)
!62 = !DILocalVariable(name: "data", scope: !59, file: !10, line: 67, type: !14)
!63 = !DILocation(line: 67, column: 9, scope: !59)
!64 = !DILocation(line: 67, column: 16, scope: !59)
!65 = !DILocalVariable(name: "buffer", scope: !66, file: !10, line: 69, type: !22)
!66 = distinct !DILexicalBlock(scope: !59, file: !10, line: 68, column: 5)
!67 = !DILocation(line: 69, column: 13, scope: !66)
!68 = !DILocation(line: 71, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !10, line: 71, column: 13)
!70 = !DILocation(line: 71, column: 18, scope: !69)
!71 = !DILocation(line: 71, column: 23, scope: !69)
!72 = !DILocation(line: 71, column: 26, scope: !69)
!73 = !DILocation(line: 71, column: 31, scope: !69)
!74 = !DILocation(line: 71, column: 13, scope: !66)
!75 = !DILocation(line: 73, column: 33, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !10, line: 72, column: 9)
!77 = !DILocation(line: 73, column: 26, scope: !76)
!78 = !DILocation(line: 73, column: 13, scope: !76)
!79 = !DILocation(line: 74, column: 9, scope: !76)
!80 = !DILocation(line: 77, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !69, file: !10, line: 76, column: 9)
!82 = !DILocation(line: 80, column: 1, scope: !59)
