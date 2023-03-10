; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType, %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType, %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %3 = bitcast i32* %2 to i8*, !dbg !36
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !36
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  call void @printWLine(i32* %arraydecay3), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !43 {
entry:
  %myStruct = alloca %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType, %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType* %myStruct, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType, %struct._CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !48
  %0 = load i32*, i32** %structFirst, align 8, !dbg !48
  store i32* %0, i32** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !56
  %2 = load i32*, i32** %data, align 8, !dbg !57
  %3 = bitcast i32* %2 to i8*, !dbg !56
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx2, align 4, !dbg !59
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay3), !dbg !61
  ret void, !dbg !62
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE127_Buffer_Underread__malloc_wchar_t_memmove_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!22 = !DILocation(line: 28, column: 128, scope: !9)
!23 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!24 = !DILocation(line: 30, column: 15, scope: !9)
!25 = !DILocation(line: 30, column: 31, scope: !9)
!26 = !DILocalVariable(name: "dest", scope: !27, file: !10, line: 32, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 32, column: 17, scope: !27)
!32 = !DILocation(line: 33, column: 17, scope: !27)
!33 = !DILocation(line: 33, column: 9, scope: !27)
!34 = !DILocation(line: 34, column: 9, scope: !27)
!35 = !DILocation(line: 34, column: 21, scope: !27)
!36 = !DILocation(line: 36, column: 9, scope: !27)
!37 = !DILocation(line: 36, column: 23, scope: !27)
!38 = !DILocation(line: 38, column: 9, scope: !27)
!39 = !DILocation(line: 38, column: 21, scope: !27)
!40 = !DILocation(line: 39, column: 20, scope: !27)
!41 = !DILocation(line: 39, column: 9, scope: !27)
!42 = !DILocation(line: 43, column: 1, scope: !9)
!43 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_67b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "myStruct", arg: 1, scope: !43, file: !10, line: 50, type: !13)
!45 = !DILocation(line: 50, column: 132, scope: !43)
!46 = !DILocalVariable(name: "data", scope: !43, file: !10, line: 52, type: !17)
!47 = !DILocation(line: 52, column: 15, scope: !43)
!48 = !DILocation(line: 52, column: 31, scope: !43)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !10, line: 54, type: !28)
!50 = distinct !DILexicalBlock(scope: !43, file: !10, line: 53, column: 5)
!51 = !DILocation(line: 54, column: 17, scope: !50)
!52 = !DILocation(line: 55, column: 17, scope: !50)
!53 = !DILocation(line: 55, column: 9, scope: !50)
!54 = !DILocation(line: 56, column: 9, scope: !50)
!55 = !DILocation(line: 56, column: 21, scope: !50)
!56 = !DILocation(line: 58, column: 9, scope: !50)
!57 = !DILocation(line: 58, column: 23, scope: !50)
!58 = !DILocation(line: 60, column: 9, scope: !50)
!59 = !DILocation(line: 60, column: 21, scope: !50)
!60 = !DILocation(line: 61, column: 20, scope: !50)
!61 = !DILocation(line: 61, column: 9, scope: !50)
!62 = !DILocation(line: 65, column: 1, scope: !43)
