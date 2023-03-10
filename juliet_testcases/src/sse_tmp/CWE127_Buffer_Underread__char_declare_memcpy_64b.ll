; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memcpy_64b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memcpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memcpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i8**, !dbg !23
  store i8** %1, i8*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !26
  %3 = load i8*, i8** %2, align 8, !dbg !27
  store i8* %3, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %4, i64 100, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx2, align 1, !dbg !40
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @printLine(i8* %arraydecay3), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memcpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !44 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !49
  %1 = bitcast i8* %0 to i8**, !dbg !50
  store i8** %1, i8*** %dataPtr, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i8** %data, metadata !51, metadata !DIExpression()), !dbg !52
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !53
  %3 = load i8*, i8** %2, align 8, !dbg !54
  store i8* %3, i8** %data, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %4 = load i8*, i8** %data, align 8, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %4, i64 100, i1 false), !dbg !61
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx2, align 1, !dbg !64
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @printLine(i8* %arraydecay3), !dbg !66
  ret void, !dbg !67
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memcpy_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 23, type: !17)
!19 = !DILocation(line: 23, column: 70, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 14, scope: !13)
!22 = !DILocation(line: 26, column: 34, scope: !13)
!23 = !DILocation(line: 26, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !5)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 21, scope: !13)
!27 = !DILocation(line: 28, column: 20, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 30, column: 14, scope: !29)
!34 = !DILocation(line: 31, column: 9, scope: !29)
!35 = !DILocation(line: 32, column: 9, scope: !29)
!36 = !DILocation(line: 32, column: 21, scope: !29)
!37 = !DILocation(line: 34, column: 9, scope: !29)
!38 = !DILocation(line: 34, column: 22, scope: !29)
!39 = !DILocation(line: 36, column: 9, scope: !29)
!40 = !DILocation(line: 36, column: 21, scope: !29)
!41 = !DILocation(line: 37, column: 19, scope: !29)
!42 = !DILocation(line: 37, column: 9, scope: !29)
!43 = !DILocation(line: 39, column: 1, scope: !13)
!44 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memcpy_64b_goodG2BSink", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !44, file: !14, line: 46, type: !17)
!46 = !DILocation(line: 46, column: 74, scope: !44)
!47 = !DILocalVariable(name: "dataPtr", scope: !44, file: !14, line: 49, type: !4)
!48 = !DILocation(line: 49, column: 14, scope: !44)
!49 = !DILocation(line: 49, column: 34, scope: !44)
!50 = !DILocation(line: 49, column: 24, scope: !44)
!51 = !DILocalVariable(name: "data", scope: !44, file: !14, line: 51, type: !5)
!52 = !DILocation(line: 51, column: 12, scope: !44)
!53 = !DILocation(line: 51, column: 21, scope: !44)
!54 = !DILocation(line: 51, column: 20, scope: !44)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !14, line: 53, type: !30)
!56 = distinct !DILexicalBlock(scope: !44, file: !14, line: 52, column: 5)
!57 = !DILocation(line: 53, column: 14, scope: !56)
!58 = !DILocation(line: 54, column: 9, scope: !56)
!59 = !DILocation(line: 55, column: 9, scope: !56)
!60 = !DILocation(line: 55, column: 21, scope: !56)
!61 = !DILocation(line: 57, column: 9, scope: !56)
!62 = !DILocation(line: 57, column: 22, scope: !56)
!63 = !DILocation(line: 59, column: 9, scope: !56)
!64 = !DILocation(line: 59, column: 21, scope: !56)
!65 = !DILocation(line: 60, column: 19, scope: !56)
!66 = !DILocation(line: 60, column: 9, scope: !56)
!67 = !DILocation(line: 62, column: 1, scope: !44)
