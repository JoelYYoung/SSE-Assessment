; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !30
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !31
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %4 = bitcast i32* %3 to i8*, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !37
  %mul = mul i64 %call3, 4, !dbg !38
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !34
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !39
  store i32 0, i32* %arrayidx4, align 4, !dbg !40
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !41
  call void @printWLine(i32* %arraydecay5), !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %6 = bitcast i32* %5 to i8*, !dbg !43
  call void @free(i8* %6) #6, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !46 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !51
  %1 = load i32*, i32** %0, align 8, !dbg !52
  store i32* %1, i32** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !60
  %3 = load i32*, i32** %data, align 8, !dbg !61
  %4 = bitcast i32* %3 to i8*, !dbg !60
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !63
  %mul = mul i64 %call3, 4, !dbg !64
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx4, align 4, !dbg !66
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay5), !dbg !68
  %5 = load i32*, i32** %data, align 8, !dbg !69
  %6 = bitcast i32* %5 to i8*, !dbg !69
  call void @free(i8* %6) #6, !dbg !70
  ret void, !dbg !71
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
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 77, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!21 = !DILocation(line: 25, column: 15, scope: !9)
!22 = !DILocation(line: 25, column: 23, scope: !9)
!23 = !DILocation(line: 25, column: 22, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 27, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 17, scope: !25)
!30 = !DILocation(line: 28, column: 17, scope: !25)
!31 = !DILocation(line: 28, column: 9, scope: !25)
!32 = !DILocation(line: 29, column: 9, scope: !25)
!33 = !DILocation(line: 29, column: 21, scope: !25)
!34 = !DILocation(line: 32, column: 9, scope: !25)
!35 = !DILocation(line: 32, column: 23, scope: !25)
!36 = !DILocation(line: 32, column: 36, scope: !25)
!37 = !DILocation(line: 32, column: 29, scope: !25)
!38 = !DILocation(line: 32, column: 41, scope: !25)
!39 = !DILocation(line: 33, column: 9, scope: !25)
!40 = !DILocation(line: 33, column: 21, scope: !25)
!41 = !DILocation(line: 34, column: 20, scope: !25)
!42 = !DILocation(line: 34, column: 9, scope: !25)
!43 = !DILocation(line: 35, column: 14, scope: !25)
!44 = !DILocation(line: 35, column: 9, scope: !25)
!45 = !DILocation(line: 37, column: 1, scope: !9)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_63b_goodG2BSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !46, file: !10, line: 44, type: !13)
!48 = !DILocation(line: 44, column: 81, scope: !46)
!49 = !DILocalVariable(name: "data", scope: !46, file: !10, line: 46, type: !14)
!50 = !DILocation(line: 46, column: 15, scope: !46)
!51 = !DILocation(line: 46, column: 23, scope: !46)
!52 = !DILocation(line: 46, column: 22, scope: !46)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !10, line: 48, type: !26)
!54 = distinct !DILexicalBlock(scope: !46, file: !10, line: 47, column: 5)
!55 = !DILocation(line: 48, column: 17, scope: !54)
!56 = !DILocation(line: 49, column: 17, scope: !54)
!57 = !DILocation(line: 49, column: 9, scope: !54)
!58 = !DILocation(line: 50, column: 9, scope: !54)
!59 = !DILocation(line: 50, column: 21, scope: !54)
!60 = !DILocation(line: 53, column: 9, scope: !54)
!61 = !DILocation(line: 53, column: 23, scope: !54)
!62 = !DILocation(line: 53, column: 36, scope: !54)
!63 = !DILocation(line: 53, column: 29, scope: !54)
!64 = !DILocation(line: 53, column: 41, scope: !54)
!65 = !DILocation(line: 54, column: 9, scope: !54)
!66 = !DILocation(line: 54, column: 21, scope: !54)
!67 = !DILocation(line: 55, column: 20, scope: !54)
!68 = !DILocation(line: 55, column: 9, scope: !54)
!69 = !DILocation(line: 56, column: 14, scope: !54)
!70 = !DILocation(line: 56, column: 9, scope: !54)
!71 = !DILocation(line: 58, column: 1, scope: !46)
