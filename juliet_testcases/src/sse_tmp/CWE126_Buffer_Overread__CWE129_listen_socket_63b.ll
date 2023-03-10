; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_63b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_63b_badSink(i32* %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !19
  %1 = load i32, i32* %0, align 4, !dbg !20
  store i32 %1, i32* %data, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !26
  %3 = load i32, i32* %data, align 4, !dbg !27
  %cmp = icmp sge i32 %3, 0, !dbg !29
  br i1 %cmp, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !31
  %idxprom = sext i32 %4 to i64, !dbg !33
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !33
  %5 = load i32, i32* %arrayidx, align 4, !dbg !33
  call void @printIntLine(i32 %5), !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_63b_goodG2BSink(i32* %dataPtr) #0 !dbg !39 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %data, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !44
  %1 = load i32, i32* %0, align 4, !dbg !45
  store i32 %1, i32* %data, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !46, metadata !DIExpression()), !dbg !48
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !48
  %3 = load i32, i32* %data, align 4, !dbg !49
  %cmp = icmp sge i32 %3, 0, !dbg !51
  br i1 %cmp, label %if.then, label %if.else, !dbg !52

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !53
  %idxprom = sext i32 %4 to i64, !dbg !55
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !55
  %5 = load i32, i32* %arrayidx, align 4, !dbg !55
  call void @printIntLine(i32 %5), !dbg !56
  br label %if.end, !dbg !57

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_63b_goodB2GSink(i32* %dataPtr) #0 !dbg !61 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !66
  %1 = load i32, i32* %0, align 4, !dbg !67
  store i32 %1, i32* %data, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !68, metadata !DIExpression()), !dbg !70
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !70
  %3 = load i32, i32* %data, align 4, !dbg !71
  %cmp = icmp sge i32 %3, 0, !dbg !73
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !74

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !75
  %cmp1 = icmp slt i32 %4, 10, !dbg !76
  br i1 %cmp1, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !78
  %idxprom = sext i32 %5 to i64, !dbg !80
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !80
  %6 = load i32, i32* %arrayidx, align 4, !dbg !80
  call void @printIntLine(i32 %6), !dbg !81
  br label %if.end, !dbg !82

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !85
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_63b_badSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 44, type: !13)
!16 = !DILocation(line: 44, column: 69, scope: !9)
!17 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 46, type: !14)
!18 = !DILocation(line: 46, column: 9, scope: !9)
!19 = !DILocation(line: 46, column: 17, scope: !9)
!20 = !DILocation(line: 46, column: 16, scope: !9)
!21 = !DILocalVariable(name: "buffer", scope: !22, file: !10, line: 48, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 47, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 48, column: 13, scope: !22)
!27 = !DILocation(line: 51, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !10, line: 51, column: 13)
!29 = !DILocation(line: 51, column: 18, scope: !28)
!30 = !DILocation(line: 51, column: 13, scope: !22)
!31 = !DILocation(line: 53, column: 33, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 52, column: 9)
!33 = !DILocation(line: 53, column: 26, scope: !32)
!34 = !DILocation(line: 53, column: 13, scope: !32)
!35 = !DILocation(line: 54, column: 9, scope: !32)
!36 = !DILocation(line: 57, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !10, line: 56, column: 9)
!38 = !DILocation(line: 60, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_63b_goodG2BSink", scope: !10, file: !10, line: 67, type: !11, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !39, file: !10, line: 67, type: !13)
!41 = !DILocation(line: 67, column: 73, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !10, line: 69, type: !14)
!43 = !DILocation(line: 69, column: 9, scope: !39)
!44 = !DILocation(line: 69, column: 17, scope: !39)
!45 = !DILocation(line: 69, column: 16, scope: !39)
!46 = !DILocalVariable(name: "buffer", scope: !47, file: !10, line: 71, type: !23)
!47 = distinct !DILexicalBlock(scope: !39, file: !10, line: 70, column: 5)
!48 = !DILocation(line: 71, column: 13, scope: !47)
!49 = !DILocation(line: 74, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !10, line: 74, column: 13)
!51 = !DILocation(line: 74, column: 18, scope: !50)
!52 = !DILocation(line: 74, column: 13, scope: !47)
!53 = !DILocation(line: 76, column: 33, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !10, line: 75, column: 9)
!55 = !DILocation(line: 76, column: 26, scope: !54)
!56 = !DILocation(line: 76, column: 13, scope: !54)
!57 = !DILocation(line: 77, column: 9, scope: !54)
!58 = !DILocation(line: 80, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !10, line: 79, column: 9)
!60 = !DILocation(line: 83, column: 1, scope: !39)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_63b_goodB2GSink", scope: !10, file: !10, line: 86, type: !11, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !61, file: !10, line: 86, type: !13)
!63 = !DILocation(line: 86, column: 73, scope: !61)
!64 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 88, type: !14)
!65 = !DILocation(line: 88, column: 9, scope: !61)
!66 = !DILocation(line: 88, column: 17, scope: !61)
!67 = !DILocation(line: 88, column: 16, scope: !61)
!68 = !DILocalVariable(name: "buffer", scope: !69, file: !10, line: 90, type: !23)
!69 = distinct !DILexicalBlock(scope: !61, file: !10, line: 89, column: 5)
!70 = !DILocation(line: 90, column: 13, scope: !69)
!71 = !DILocation(line: 92, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !10, line: 92, column: 13)
!73 = !DILocation(line: 92, column: 18, scope: !72)
!74 = !DILocation(line: 92, column: 23, scope: !72)
!75 = !DILocation(line: 92, column: 26, scope: !72)
!76 = !DILocation(line: 92, column: 31, scope: !72)
!77 = !DILocation(line: 92, column: 13, scope: !69)
!78 = !DILocation(line: 94, column: 33, scope: !79)
!79 = distinct !DILexicalBlock(scope: !72, file: !10, line: 93, column: 9)
!80 = !DILocation(line: 94, column: 26, scope: !79)
!81 = !DILocation(line: 94, column: 13, scope: !79)
!82 = !DILocation(line: 95, column: 9, scope: !79)
!83 = !DILocation(line: 98, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !10, line: 97, column: 9)
!85 = !DILocation(line: 101, column: 1, scope: !61)
