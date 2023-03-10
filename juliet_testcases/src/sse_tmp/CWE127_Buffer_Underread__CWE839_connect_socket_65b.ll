; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_65b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_65b_badSink(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !16, metadata !DIExpression()), !dbg !21
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !21
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !21
  %1 = load i32, i32* %data.addr, align 4, !dbg !22
  %cmp = icmp slt i32 %1, 10, !dbg !24
  br i1 %cmp, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !26
  %idxprom = sext i32 %2 to i64, !dbg !28
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !28
  %3 = load i32, i32* %arrayidx, align 4, !dbg !28
  call void @printIntLine(i32 %3), !dbg !29
  br label %if.end, !dbg !30

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !31
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_65b_goodG2BSink(i32 %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !39
  %1 = load i32, i32* %data.addr, align 4, !dbg !40
  %cmp = icmp slt i32 %1, 10, !dbg !42
  br i1 %cmp, label %if.then, label %if.else, !dbg !43

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !44
  %idxprom = sext i32 %2 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  %3 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 %3), !dbg !47
  br label %if.end, !dbg !48

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !49
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_65b_goodB2GSink(i32 %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !57
  %1 = load i32, i32* %data.addr, align 4, !dbg !58
  %cmp = icmp sge i32 %1, 0, !dbg !60
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !61

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !62
  %cmp1 = icmp slt i32 %2, 10, !dbg !63
  br i1 %cmp1, label %if.then, label %if.else, !dbg !64

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !65
  %idxprom = sext i32 %3 to i64, !dbg !67
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !67
  %4 = load i32, i32* %arrayidx, align 4, !dbg !67
  call void @printIntLine(i32 %4), !dbg !68
  br label %if.end, !dbg !69

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !72
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_65b_badSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 44, type: !13)
!15 = !DILocation(line: 44, column: 69, scope: !9)
!16 = !DILocalVariable(name: "buffer", scope: !17, file: !10, line: 47, type: !18)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 46, column: 5)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 10)
!21 = !DILocation(line: 47, column: 13, scope: !17)
!22 = !DILocation(line: 50, column: 13, scope: !23)
!23 = distinct !DILexicalBlock(scope: !17, file: !10, line: 50, column: 13)
!24 = !DILocation(line: 50, column: 18, scope: !23)
!25 = !DILocation(line: 50, column: 13, scope: !17)
!26 = !DILocation(line: 52, column: 33, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 51, column: 9)
!28 = !DILocation(line: 52, column: 26, scope: !27)
!29 = !DILocation(line: 52, column: 13, scope: !27)
!30 = !DILocation(line: 53, column: 9, scope: !27)
!31 = !DILocation(line: 56, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !23, file: !10, line: 55, column: 9)
!33 = !DILocation(line: 59, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_65b_goodG2BSink", scope: !10, file: !10, line: 66, type: !11, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !10, line: 66, type: !13)
!36 = !DILocation(line: 66, column: 73, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !38, file: !10, line: 69, type: !18)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 68, column: 5)
!39 = !DILocation(line: 69, column: 13, scope: !38)
!40 = !DILocation(line: 72, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 72, column: 13)
!42 = !DILocation(line: 72, column: 18, scope: !41)
!43 = !DILocation(line: 72, column: 13, scope: !38)
!44 = !DILocation(line: 74, column: 33, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 73, column: 9)
!46 = !DILocation(line: 74, column: 26, scope: !45)
!47 = !DILocation(line: 74, column: 13, scope: !45)
!48 = !DILocation(line: 75, column: 9, scope: !45)
!49 = !DILocation(line: 78, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !10, line: 77, column: 9)
!51 = !DILocation(line: 81, column: 1, scope: !34)
!52 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_65b_goodB2GSink", scope: !10, file: !10, line: 84, type: !11, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !10, line: 84, type: !13)
!54 = !DILocation(line: 84, column: 73, scope: !52)
!55 = !DILocalVariable(name: "buffer", scope: !56, file: !10, line: 87, type: !18)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 86, column: 5)
!57 = !DILocation(line: 87, column: 13, scope: !56)
!58 = !DILocation(line: 89, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !10, line: 89, column: 13)
!60 = !DILocation(line: 89, column: 18, scope: !59)
!61 = !DILocation(line: 89, column: 23, scope: !59)
!62 = !DILocation(line: 89, column: 26, scope: !59)
!63 = !DILocation(line: 89, column: 31, scope: !59)
!64 = !DILocation(line: 89, column: 13, scope: !56)
!65 = !DILocation(line: 91, column: 33, scope: !66)
!66 = distinct !DILexicalBlock(scope: !59, file: !10, line: 90, column: 9)
!67 = !DILocation(line: 91, column: 26, scope: !66)
!68 = !DILocation(line: 91, column: 13, scope: !66)
!69 = !DILocation(line: 92, column: 9, scope: !66)
!70 = !DILocation(line: 95, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !59, file: !10, line: 94, column: 9)
!72 = !DILocation(line: 98, column: 1, scope: !52)
