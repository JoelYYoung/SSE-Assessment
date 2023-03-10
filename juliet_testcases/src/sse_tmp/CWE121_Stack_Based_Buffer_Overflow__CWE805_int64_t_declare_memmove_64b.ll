; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b_badSink(i8* %dataVoidPtr) #0 !dbg !17 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !26
  %1 = bitcast i8* %0 to i64**, !dbg !27
  store i64** %1, i64*** %dataPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !30
  %3 = load i64*, i64** %2, align 8, !dbg !31
  store i64* %3, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !37
  %5 = load i64*, i64** %data, align 8, !dbg !38
  %6 = bitcast i64* %5 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !39
  %7 = bitcast i64* %arraydecay to i8*, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !39
  %8 = load i64*, i64** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !40
  %9 = load i64, i64* %arrayidx, align 8, !dbg !40
  call void @printLongLongLine(i64 %9), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !43 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !48
  %1 = bitcast i8* %0 to i64**, !dbg !49
  store i64** %1, i64*** %dataPtr, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64** %data, metadata !50, metadata !DIExpression()), !dbg !51
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !52
  %3 = load i64*, i64** %2, align 8, !dbg !53
  store i64* %3, i64** %data, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !54, metadata !DIExpression()), !dbg !56
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !56
  %5 = load i64*, i64** %data, align 8, !dbg !57
  %6 = bitcast i64* %5 to i8*, !dbg !58
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !58
  %7 = bitcast i64* %arraydecay to i8*, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !58
  %8 = load i64*, i64** %data, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !59
  %9 = load i64, i64* %arrayidx, align 8, !dbg !59
  call void @printLongLongLine(i64 %9), !dbg !60
  ret void, !dbg !61
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b_badSink", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !17, file: !18, line: 21, type: !21)
!23 = !DILocation(line: 21, column: 92, scope: !17)
!24 = !DILocalVariable(name: "dataPtr", scope: !17, file: !18, line: 24, type: !4)
!25 = !DILocation(line: 24, column: 17, scope: !17)
!26 = !DILocation(line: 24, column: 40, scope: !17)
!27 = !DILocation(line: 24, column: 27, scope: !17)
!28 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !5)
!29 = !DILocation(line: 26, column: 15, scope: !17)
!30 = !DILocation(line: 26, column: 24, scope: !17)
!31 = !DILocation(line: 26, column: 23, scope: !17)
!32 = !DILocalVariable(name: "source", scope: !33, file: !18, line: 28, type: !34)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 27, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 28, column: 17, scope: !33)
!38 = !DILocation(line: 30, column: 17, scope: !33)
!39 = !DILocation(line: 30, column: 9, scope: !33)
!40 = !DILocation(line: 31, column: 27, scope: !33)
!41 = !DILocation(line: 31, column: 9, scope: !33)
!42 = !DILocation(line: 33, column: 1, scope: !17)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_64b_goodG2BSink", scope: !18, file: !18, line: 40, type: !19, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !43, file: !18, line: 40, type: !21)
!45 = !DILocation(line: 40, column: 96, scope: !43)
!46 = !DILocalVariable(name: "dataPtr", scope: !43, file: !18, line: 43, type: !4)
!47 = !DILocation(line: 43, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 40, scope: !43)
!49 = !DILocation(line: 43, column: 27, scope: !43)
!50 = !DILocalVariable(name: "data", scope: !43, file: !18, line: 45, type: !5)
!51 = !DILocation(line: 45, column: 15, scope: !43)
!52 = !DILocation(line: 45, column: 24, scope: !43)
!53 = !DILocation(line: 45, column: 23, scope: !43)
!54 = !DILocalVariable(name: "source", scope: !55, file: !18, line: 47, type: !34)
!55 = distinct !DILexicalBlock(scope: !43, file: !18, line: 46, column: 5)
!56 = !DILocation(line: 47, column: 17, scope: !55)
!57 = !DILocation(line: 49, column: 17, scope: !55)
!58 = !DILocation(line: 49, column: 9, scope: !55)
!59 = !DILocation(line: 50, column: 27, scope: !55)
!60 = !DILocation(line: 50, column: 9, scope: !55)
!61 = !DILocation(line: 52, column: 1, scope: !43)
