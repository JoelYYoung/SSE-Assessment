; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_65b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !36
  store i64 %call2, i64* %destLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %1 = load i64, i64* %destLen, align 8, !dbg !43
  %cmp = icmp ult i64 %0, %1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !46
  %3 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !46
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !46
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !50
  store i32 %4, i32* %arrayidx4, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %6, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx5, align 4, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay6), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_65b_goodG2BSink(i32* %data) #0 !dbg !63 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !73
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !74
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !78
  store i64 %call2, i64* %destLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !83
  %1 = load i64, i64* %destLen, align 8, !dbg !85
  %cmp = icmp ult i64 %0, %1, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !88
  %3 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !88
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !88
  %5 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !92
  store i32 %4, i32* %arrayidx4, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %6, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx5, align 4, !dbg !100
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  call void @printWLine(i32* %arraydecay6), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 73, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !22)
!22 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 26, column: 16, scope: !20)
!24 = !DILocalVariable(name: "destLen", scope: !20, file: !10, line: 26, type: !21)
!25 = !DILocation(line: 26, column: 19, scope: !20)
!26 = !DILocalVariable(name: "dest", scope: !20, file: !10, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 17, scope: !20)
!31 = !DILocation(line: 28, column: 17, scope: !20)
!32 = !DILocation(line: 28, column: 9, scope: !20)
!33 = !DILocation(line: 29, column: 9, scope: !20)
!34 = !DILocation(line: 29, column: 21, scope: !20)
!35 = !DILocation(line: 30, column: 26, scope: !20)
!36 = !DILocation(line: 30, column: 19, scope: !20)
!37 = !DILocation(line: 30, column: 17, scope: !20)
!38 = !DILocation(line: 33, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 33, column: 9)
!40 = !DILocation(line: 33, column: 14, scope: !39)
!41 = !DILocation(line: 33, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 33, column: 9)
!43 = !DILocation(line: 33, column: 25, scope: !42)
!44 = !DILocation(line: 33, column: 23, scope: !42)
!45 = !DILocation(line: 33, column: 9, scope: !39)
!46 = !DILocation(line: 35, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !10, line: 34, column: 9)
!48 = !DILocation(line: 35, column: 28, scope: !47)
!49 = !DILocation(line: 35, column: 18, scope: !47)
!50 = !DILocation(line: 35, column: 13, scope: !47)
!51 = !DILocation(line: 35, column: 21, scope: !47)
!52 = !DILocation(line: 36, column: 9, scope: !47)
!53 = !DILocation(line: 33, column: 35, scope: !42)
!54 = !DILocation(line: 33, column: 9, scope: !42)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 36, column: 9, scope: !39)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 37, column: 9, scope: !20)
!59 = !DILocation(line: 37, column: 21, scope: !20)
!60 = !DILocation(line: 38, column: 20, scope: !20)
!61 = !DILocation(line: 38, column: 9, scope: !20)
!62 = !DILocation(line: 40, column: 1, scope: !9)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_65b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", arg: 1, scope: !63, file: !10, line: 47, type: !13)
!65 = !DILocation(line: 47, column: 77, scope: !63)
!66 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 50, type: !21)
!67 = distinct !DILexicalBlock(scope: !63, file: !10, line: 49, column: 5)
!68 = !DILocation(line: 50, column: 16, scope: !67)
!69 = !DILocalVariable(name: "destLen", scope: !67, file: !10, line: 50, type: !21)
!70 = !DILocation(line: 50, column: 19, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !67, file: !10, line: 51, type: !27)
!72 = !DILocation(line: 51, column: 17, scope: !67)
!73 = !DILocation(line: 52, column: 17, scope: !67)
!74 = !DILocation(line: 52, column: 9, scope: !67)
!75 = !DILocation(line: 53, column: 9, scope: !67)
!76 = !DILocation(line: 53, column: 21, scope: !67)
!77 = !DILocation(line: 54, column: 26, scope: !67)
!78 = !DILocation(line: 54, column: 19, scope: !67)
!79 = !DILocation(line: 54, column: 17, scope: !67)
!80 = !DILocation(line: 57, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !10, line: 57, column: 9)
!82 = !DILocation(line: 57, column: 14, scope: !81)
!83 = !DILocation(line: 57, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 57, column: 9)
!85 = !DILocation(line: 57, column: 25, scope: !84)
!86 = !DILocation(line: 57, column: 23, scope: !84)
!87 = !DILocation(line: 57, column: 9, scope: !81)
!88 = !DILocation(line: 59, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !10, line: 58, column: 9)
!90 = !DILocation(line: 59, column: 28, scope: !89)
!91 = !DILocation(line: 59, column: 18, scope: !89)
!92 = !DILocation(line: 59, column: 13, scope: !89)
!93 = !DILocation(line: 59, column: 21, scope: !89)
!94 = !DILocation(line: 60, column: 9, scope: !89)
!95 = !DILocation(line: 57, column: 35, scope: !84)
!96 = !DILocation(line: 57, column: 9, scope: !84)
!97 = distinct !{!97, !87, !98, !57}
!98 = !DILocation(line: 60, column: 9, scope: !81)
!99 = !DILocation(line: 61, column: 9, scope: !67)
!100 = !DILocation(line: 61, column: 21, scope: !67)
!101 = !DILocation(line: 62, column: 20, scope: !67)
!102 = !DILocation(line: 62, column: 9, scope: !67)
!103 = !DILocation(line: 64, column: 1, scope: !63)
