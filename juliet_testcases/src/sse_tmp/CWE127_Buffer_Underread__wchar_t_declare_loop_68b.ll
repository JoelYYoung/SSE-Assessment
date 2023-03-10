; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__wchar_t_declare_loop_68_badData = external dso_local global i32*, align 8
@CWE127_Buffer_Underread__wchar_t_declare_loop_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_declare_loop_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !30
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !31
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %1, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %3 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !41
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !45
  store i32 %4, i32* %arrayidx2, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %6, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx3, align 4, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay4), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_68b_goodG2BSink() #0 !dbg !58 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_declare_loop_68_goodG2BData, align 8, !dbg !61
  store i32* %0, i32** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i64* %i, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !65, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !68
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !74
  %cmp = icmp ult i64 %1, 100, !dbg !76
  br i1 %cmp, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !78
  %3 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !78
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !78
  %5 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !82
  store i32 %4, i32* %arrayidx2, align 4, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %6, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx3, align 4, !dbg !90
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay4), !dbg !92
  ret void, !dbg !93
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 15, scope: !9)
!19 = !DILocation(line: 30, column: 22, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !23)
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 32, column: 16, scope: !21)
!25 = !DILocalVariable(name: "dest", scope: !21, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 17, scope: !21)
!30 = !DILocation(line: 34, column: 17, scope: !21)
!31 = !DILocation(line: 34, column: 9, scope: !21)
!32 = !DILocation(line: 35, column: 9, scope: !21)
!33 = !DILocation(line: 35, column: 21, scope: !21)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !10, line: 37, column: 9)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocation(line: 37, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 37, column: 9)
!39 = !DILocation(line: 37, column: 23, scope: !38)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 39, column: 23, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 38, column: 9)
!43 = !DILocation(line: 39, column: 28, scope: !42)
!44 = !DILocation(line: 39, column: 18, scope: !42)
!45 = !DILocation(line: 39, column: 13, scope: !42)
!46 = !DILocation(line: 39, column: 21, scope: !42)
!47 = !DILocation(line: 40, column: 9, scope: !42)
!48 = !DILocation(line: 37, column: 31, scope: !38)
!49 = !DILocation(line: 37, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 40, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 42, column: 9, scope: !21)
!54 = !DILocation(line: 42, column: 21, scope: !21)
!55 = !DILocation(line: 43, column: 20, scope: !21)
!56 = !DILocation(line: 43, column: 9, scope: !21)
!57 = !DILocation(line: 45, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_68b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !10, line: 54, type: !14)
!60 = !DILocation(line: 54, column: 15, scope: !58)
!61 = !DILocation(line: 54, column: 22, scope: !58)
!62 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 56, type: !22)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 55, column: 5)
!64 = !DILocation(line: 56, column: 16, scope: !63)
!65 = !DILocalVariable(name: "dest", scope: !63, file: !10, line: 57, type: !26)
!66 = !DILocation(line: 57, column: 17, scope: !63)
!67 = !DILocation(line: 58, column: 17, scope: !63)
!68 = !DILocation(line: 58, column: 9, scope: !63)
!69 = !DILocation(line: 59, column: 9, scope: !63)
!70 = !DILocation(line: 59, column: 21, scope: !63)
!71 = !DILocation(line: 61, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !63, file: !10, line: 61, column: 9)
!73 = !DILocation(line: 61, column: 14, scope: !72)
!74 = !DILocation(line: 61, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 61, column: 9)
!76 = !DILocation(line: 61, column: 23, scope: !75)
!77 = !DILocation(line: 61, column: 9, scope: !72)
!78 = !DILocation(line: 63, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 62, column: 9)
!80 = !DILocation(line: 63, column: 28, scope: !79)
!81 = !DILocation(line: 63, column: 18, scope: !79)
!82 = !DILocation(line: 63, column: 13, scope: !79)
!83 = !DILocation(line: 63, column: 21, scope: !79)
!84 = !DILocation(line: 64, column: 9, scope: !79)
!85 = !DILocation(line: 61, column: 31, scope: !75)
!86 = !DILocation(line: 61, column: 9, scope: !75)
!87 = distinct !{!87, !77, !88, !52}
!88 = !DILocation(line: 64, column: 9, scope: !72)
!89 = !DILocation(line: 66, column: 9, scope: !63)
!90 = !DILocation(line: 66, column: 21, scope: !63)
!91 = !DILocation(line: 67, column: 20, scope: !63)
!92 = !DILocation(line: 67, column: 9, scope: !63)
!93 = !DILocation(line: 69, column: 1, scope: !58)
