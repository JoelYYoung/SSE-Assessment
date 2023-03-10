; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_66b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !30
  %arrayidx1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !31
  store i32 0, i32* %arrayidx1, align 4, !dbg !32
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %2) #4, !dbg !35
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay4), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_66b_goodG2BSink(i32** %dataArray) #0 !dbg !39 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !44
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !44
  store i32* %1, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !49
  %arrayidx1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !50
  store i32 0, i32* %arrayidx1, align 4, !dbg !51
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !52
  %2 = load i32*, i32** %data, align 8, !dbg !53
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %2) #4, !dbg !54
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay4), !dbg !56
  ret void, !dbg !57
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 73, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!21 = !DILocation(line: 26, column: 15, scope: !9)
!22 = !DILocation(line: 26, column: 22, scope: !9)
!23 = !DILocalVariable(name: "dest", scope: !24, file: !10, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 200)
!28 = !DILocation(line: 28, column: 17, scope: !24)
!29 = !DILocation(line: 29, column: 17, scope: !24)
!30 = !DILocation(line: 29, column: 9, scope: !24)
!31 = !DILocation(line: 30, column: 9, scope: !24)
!32 = !DILocation(line: 30, column: 23, scope: !24)
!33 = !DILocation(line: 32, column: 16, scope: !24)
!34 = !DILocation(line: 32, column: 22, scope: !24)
!35 = !DILocation(line: 32, column: 9, scope: !24)
!36 = !DILocation(line: 33, column: 20, scope: !24)
!37 = !DILocation(line: 33, column: 9, scope: !24)
!38 = !DILocation(line: 35, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_66b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "dataArray", arg: 1, scope: !39, file: !10, line: 42, type: !13)
!41 = !DILocation(line: 42, column: 77, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !10, line: 44, type: !14)
!43 = !DILocation(line: 44, column: 15, scope: !39)
!44 = !DILocation(line: 44, column: 22, scope: !39)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !10, line: 46, type: !25)
!46 = distinct !DILexicalBlock(scope: !39, file: !10, line: 45, column: 5)
!47 = !DILocation(line: 46, column: 17, scope: !46)
!48 = !DILocation(line: 47, column: 17, scope: !46)
!49 = !DILocation(line: 47, column: 9, scope: !46)
!50 = !DILocation(line: 48, column: 9, scope: !46)
!51 = !DILocation(line: 48, column: 23, scope: !46)
!52 = !DILocation(line: 50, column: 16, scope: !46)
!53 = !DILocation(line: 50, column: 22, scope: !46)
!54 = !DILocation(line: 50, column: 9, scope: !46)
!55 = !DILocation(line: 51, column: 20, scope: !46)
!56 = !DILocation(line: 51, column: 9, scope: !46)
!57 = !DILocation(line: 53, column: 1, scope: !39)
