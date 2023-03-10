; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType, %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType, %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %1, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !47
  %3 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !47
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !51
  store i32 %4, i32* %arrayidx2, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %6, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay4), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !64 {
entry:
  %myStruct = alloca %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType, %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType* %myStruct, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType, %struct._CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  %0 = load i32*, i32** %structFirst, align 8, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !82
  %cmp = icmp ult i64 %1, 100, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !86
  %3 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !86
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !86
  %5 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !90
  store i32 %4, i32* %arrayidx2, align 4, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !93
  %inc = add i64 %6, 1, !dbg !93
  store i64 %inc, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx3, align 4, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !99
  call void @printWLine(i32* %arraydecay4), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE127_Buffer_Underread__wchar_t_alloca_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!22 = !DILocation(line: 28, column: 122, scope: !9)
!23 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!24 = !DILocation(line: 30, column: 15, scope: !9)
!25 = !DILocation(line: 30, column: 31, scope: !9)
!26 = !DILocalVariable(name: "i", scope: !27, file: !10, line: 32, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !19, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 32, column: 16, scope: !27)
!31 = !DILocalVariable(name: "dest", scope: !27, file: !10, line: 33, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 33, column: 17, scope: !27)
!36 = !DILocation(line: 34, column: 17, scope: !27)
!37 = !DILocation(line: 34, column: 9, scope: !27)
!38 = !DILocation(line: 35, column: 9, scope: !27)
!39 = !DILocation(line: 35, column: 21, scope: !27)
!40 = !DILocation(line: 37, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !27, file: !10, line: 37, column: 9)
!42 = !DILocation(line: 37, column: 14, scope: !41)
!43 = !DILocation(line: 37, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 37, column: 9)
!45 = !DILocation(line: 37, column: 23, scope: !44)
!46 = !DILocation(line: 37, column: 9, scope: !41)
!47 = !DILocation(line: 39, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !10, line: 38, column: 9)
!49 = !DILocation(line: 39, column: 28, scope: !48)
!50 = !DILocation(line: 39, column: 18, scope: !48)
!51 = !DILocation(line: 39, column: 13, scope: !48)
!52 = !DILocation(line: 39, column: 21, scope: !48)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 37, column: 31, scope: !44)
!55 = !DILocation(line: 37, column: 9, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 40, column: 9, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 42, column: 9, scope: !27)
!60 = !DILocation(line: 42, column: 21, scope: !27)
!61 = !DILocation(line: 43, column: 20, scope: !27)
!62 = !DILocation(line: 43, column: 9, scope: !27)
!63 = !DILocation(line: 45, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_67b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "myStruct", arg: 1, scope: !64, file: !10, line: 52, type: !13)
!66 = !DILocation(line: 52, column: 126, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 54, type: !17)
!68 = !DILocation(line: 54, column: 15, scope: !64)
!69 = !DILocation(line: 54, column: 31, scope: !64)
!70 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 56, type: !28)
!71 = distinct !DILexicalBlock(scope: !64, file: !10, line: 55, column: 5)
!72 = !DILocation(line: 56, column: 16, scope: !71)
!73 = !DILocalVariable(name: "dest", scope: !71, file: !10, line: 57, type: !32)
!74 = !DILocation(line: 57, column: 17, scope: !71)
!75 = !DILocation(line: 58, column: 17, scope: !71)
!76 = !DILocation(line: 58, column: 9, scope: !71)
!77 = !DILocation(line: 59, column: 9, scope: !71)
!78 = !DILocation(line: 59, column: 21, scope: !71)
!79 = !DILocation(line: 61, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !10, line: 61, column: 9)
!81 = !DILocation(line: 61, column: 14, scope: !80)
!82 = !DILocation(line: 61, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 61, column: 9)
!84 = !DILocation(line: 61, column: 23, scope: !83)
!85 = !DILocation(line: 61, column: 9, scope: !80)
!86 = !DILocation(line: 63, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 62, column: 9)
!88 = !DILocation(line: 63, column: 28, scope: !87)
!89 = !DILocation(line: 63, column: 18, scope: !87)
!90 = !DILocation(line: 63, column: 13, scope: !87)
!91 = !DILocation(line: 63, column: 21, scope: !87)
!92 = !DILocation(line: 64, column: 9, scope: !87)
!93 = !DILocation(line: 61, column: 31, scope: !83)
!94 = !DILocation(line: 61, column: 9, scope: !83)
!95 = distinct !{!95, !85, !96, !58}
!96 = !DILocation(line: 64, column: 9, scope: !80)
!97 = !DILocation(line: 66, column: 9, scope: !71)
!98 = !DILocation(line: 66, column: 21, scope: !71)
!99 = !DILocation(line: 67, column: 20, scope: !71)
!100 = !DILocation(line: 67, column: 9, scope: !71)
!101 = !DILocation(line: 69, column: 1, scope: !64)
