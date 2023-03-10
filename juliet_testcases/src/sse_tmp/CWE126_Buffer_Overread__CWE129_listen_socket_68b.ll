; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_68b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__CWE129_listen_socket_68_badData = external dso_local global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@CWE126_Buffer_Overread__CWE129_listen_socket_68_goodG2BData = external dso_local global i32, align 4
@CWE126_Buffer_Overread__CWE129_listen_socket_68_goodB2GData = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !13, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_listen_socket_68_badData, align 4, !dbg !16
  store i32 %0, i32* %data, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !17, metadata !DIExpression()), !dbg !22
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !22
  %2 = load i32, i32* %data, align 4, !dbg !23
  %cmp = icmp sge i32 %2, 0, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !27
  %idxprom = sext i32 %3 to i64, !dbg !29
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !29
  %4 = load i32, i32* %arrayidx, align 4, !dbg !29
  call void @printIntLine(i32 %4), !dbg !30
  br label %if.end, !dbg !31

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !32
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_68b_goodG2BSink() #0 !dbg !35 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_listen_socket_68_goodG2BData, align 4, !dbg !38
  store i32 %0, i32* %data, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !39, metadata !DIExpression()), !dbg !41
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !41
  %2 = load i32, i32* %data, align 4, !dbg !42
  %cmp = icmp sge i32 %2, 0, !dbg !44
  br i1 %cmp, label %if.then, label %if.else, !dbg !45

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !46
  %idxprom = sext i32 %3 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !48
  %4 = load i32, i32* %arrayidx, align 4, !dbg !48
  call void @printIntLine(i32 %4), !dbg !49
  br label %if.end, !dbg !50

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !51
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_68b_goodB2GSink() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_listen_socket_68_goodB2GData, align 4, !dbg !57
  store i32 %0, i32* %data, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !58, metadata !DIExpression()), !dbg !60
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !60
  %2 = load i32, i32* %data, align 4, !dbg !61
  %cmp = icmp sge i32 %2, 0, !dbg !63
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !64

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !65
  %cmp1 = icmp slt i32 %3, 10, !dbg !66
  br i1 %cmp1, label %if.then, label %if.else, !dbg !67

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !68
  %idxprom = sext i32 %4 to i64, !dbg !70
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !70
  %5 = load i32, i32* %arrayidx, align 4, !dbg !70
  call void @printIntLine(i32 %5), !dbg !71
  br label %if.end, !dbg !72

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !75
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_68b_badSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 50, type: !14)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocation(line: 50, column: 9, scope: !9)
!16 = !DILocation(line: 50, column: 16, scope: !9)
!17 = !DILocalVariable(name: "buffer", scope: !18, file: !10, line: 52, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 51, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 52, column: 13, scope: !18)
!23 = !DILocation(line: 55, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !10, line: 55, column: 13)
!25 = !DILocation(line: 55, column: 18, scope: !24)
!26 = !DILocation(line: 55, column: 13, scope: !18)
!27 = !DILocation(line: 57, column: 33, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 56, column: 9)
!29 = !DILocation(line: 57, column: 26, scope: !28)
!30 = !DILocation(line: 57, column: 13, scope: !28)
!31 = !DILocation(line: 58, column: 9, scope: !28)
!32 = !DILocation(line: 61, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !10, line: 60, column: 9)
!34 = !DILocation(line: 64, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_68b_goodG2BSink", scope: !10, file: !10, line: 71, type: !11, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 73, type: !14)
!37 = !DILocation(line: 73, column: 9, scope: !35)
!38 = !DILocation(line: 73, column: 16, scope: !35)
!39 = !DILocalVariable(name: "buffer", scope: !40, file: !10, line: 75, type: !19)
!40 = distinct !DILexicalBlock(scope: !35, file: !10, line: 74, column: 5)
!41 = !DILocation(line: 75, column: 13, scope: !40)
!42 = !DILocation(line: 78, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 78, column: 13)
!44 = !DILocation(line: 78, column: 18, scope: !43)
!45 = !DILocation(line: 78, column: 13, scope: !40)
!46 = !DILocation(line: 80, column: 33, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !10, line: 79, column: 9)
!48 = !DILocation(line: 80, column: 26, scope: !47)
!49 = !DILocation(line: 80, column: 13, scope: !47)
!50 = !DILocation(line: 81, column: 9, scope: !47)
!51 = !DILocation(line: 84, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !10, line: 83, column: 9)
!53 = !DILocation(line: 87, column: 1, scope: !35)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_68b_goodB2GSink", scope: !10, file: !10, line: 90, type: !11, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", scope: !54, file: !10, line: 92, type: !14)
!56 = !DILocation(line: 92, column: 9, scope: !54)
!57 = !DILocation(line: 92, column: 16, scope: !54)
!58 = !DILocalVariable(name: "buffer", scope: !59, file: !10, line: 94, type: !19)
!59 = distinct !DILexicalBlock(scope: !54, file: !10, line: 93, column: 5)
!60 = !DILocation(line: 94, column: 13, scope: !59)
!61 = !DILocation(line: 96, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 96, column: 13)
!63 = !DILocation(line: 96, column: 18, scope: !62)
!64 = !DILocation(line: 96, column: 23, scope: !62)
!65 = !DILocation(line: 96, column: 26, scope: !62)
!66 = !DILocation(line: 96, column: 31, scope: !62)
!67 = !DILocation(line: 96, column: 13, scope: !59)
!68 = !DILocation(line: 98, column: 33, scope: !69)
!69 = distinct !DILexicalBlock(scope: !62, file: !10, line: 97, column: 9)
!70 = !DILocation(line: 98, column: 26, scope: !69)
!71 = !DILocation(line: 98, column: 13, scope: !69)
!72 = !DILocation(line: 99, column: 9, scope: !69)
!73 = !DILocation(line: 102, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !62, file: !10, line: 101, column: 9)
!75 = !DILocation(line: 105, column: 1, scope: !54)
