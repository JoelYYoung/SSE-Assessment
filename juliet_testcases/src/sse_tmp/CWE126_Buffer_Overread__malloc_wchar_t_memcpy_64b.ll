; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !24
  %1 = bitcast i8* %0 to i32**, !dbg !25
  store i32** %1, i32*** %dataPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !28
  %3 = load i32*, i32** %2, align 8, !dbg !29
  store i32* %3, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %6 = bitcast i32* %5 to i8*, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !43
  %mul = mul i64 %call3, 4, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !40
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx4, align 4, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  call void @printWLine(i32* %arraydecay5), !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %8 = bitcast i32* %7 to i8*, !dbg !49
  call void @free(i8* %8) #6, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !52 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !57
  %1 = bitcast i8* %0 to i32**, !dbg !58
  store i32** %1, i32*** %dataPtr, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !61
  %3 = load i32*, i32** %2, align 8, !dbg !62
  store i32* %3, i32** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !63, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !67
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !70
  %5 = load i32*, i32** %data, align 8, !dbg !71
  %6 = bitcast i32* %5 to i8*, !dbg !70
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !73
  %mul = mul i64 %call3, 4, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !70
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx4, align 4, !dbg !76
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  call void @printWLine(i32* %arraydecay5), !dbg !78
  %7 = load i32*, i32** %data, align 8, !dbg !79
  %8 = bitcast i32* %7 to i8*, !dbg !79
  call void @free(i8* %8) #6, !dbg !80
  ret void, !dbg !81
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 71, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 17, scope: !15)
!24 = !DILocation(line: 26, column: 40, scope: !15)
!25 = !DILocation(line: 26, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !5)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 24, scope: !15)
!29 = !DILocation(line: 28, column: 23, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 30, column: 17, scope: !31)
!36 = !DILocation(line: 31, column: 17, scope: !31)
!37 = !DILocation(line: 31, column: 9, scope: !31)
!38 = !DILocation(line: 32, column: 9, scope: !31)
!39 = !DILocation(line: 32, column: 21, scope: !31)
!40 = !DILocation(line: 35, column: 9, scope: !31)
!41 = !DILocation(line: 35, column: 22, scope: !31)
!42 = !DILocation(line: 35, column: 35, scope: !31)
!43 = !DILocation(line: 35, column: 28, scope: !31)
!44 = !DILocation(line: 35, column: 40, scope: !31)
!45 = !DILocation(line: 36, column: 9, scope: !31)
!46 = !DILocation(line: 36, column: 21, scope: !31)
!47 = !DILocation(line: 37, column: 20, scope: !31)
!48 = !DILocation(line: 37, column: 9, scope: !31)
!49 = !DILocation(line: 38, column: 14, scope: !31)
!50 = !DILocation(line: 38, column: 9, scope: !31)
!51 = !DILocation(line: 40, column: 1, scope: !15)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_64b_goodG2BSink", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !52, file: !16, line: 47, type: !19)
!54 = !DILocation(line: 47, column: 75, scope: !52)
!55 = !DILocalVariable(name: "dataPtr", scope: !52, file: !16, line: 50, type: !4)
!56 = !DILocation(line: 50, column: 17, scope: !52)
!57 = !DILocation(line: 50, column: 40, scope: !52)
!58 = !DILocation(line: 50, column: 27, scope: !52)
!59 = !DILocalVariable(name: "data", scope: !52, file: !16, line: 52, type: !5)
!60 = !DILocation(line: 52, column: 15, scope: !52)
!61 = !DILocation(line: 52, column: 24, scope: !52)
!62 = !DILocation(line: 52, column: 23, scope: !52)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !16, line: 54, type: !32)
!64 = distinct !DILexicalBlock(scope: !52, file: !16, line: 53, column: 5)
!65 = !DILocation(line: 54, column: 17, scope: !64)
!66 = !DILocation(line: 55, column: 17, scope: !64)
!67 = !DILocation(line: 55, column: 9, scope: !64)
!68 = !DILocation(line: 56, column: 9, scope: !64)
!69 = !DILocation(line: 56, column: 21, scope: !64)
!70 = !DILocation(line: 59, column: 9, scope: !64)
!71 = !DILocation(line: 59, column: 22, scope: !64)
!72 = !DILocation(line: 59, column: 35, scope: !64)
!73 = !DILocation(line: 59, column: 28, scope: !64)
!74 = !DILocation(line: 59, column: 40, scope: !64)
!75 = !DILocation(line: 60, column: 9, scope: !64)
!76 = !DILocation(line: 60, column: 21, scope: !64)
!77 = !DILocation(line: 61, column: 20, scope: !64)
!78 = !DILocation(line: 61, column: 9, scope: !64)
!79 = !DILocation(line: 62, column: 14, scope: !64)
!80 = !DILocation(line: 62, column: 9, scope: !64)
!81 = !DILocation(line: 64, column: 1, scope: !52)