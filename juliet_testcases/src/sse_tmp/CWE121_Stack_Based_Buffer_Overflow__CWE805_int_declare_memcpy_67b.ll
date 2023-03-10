; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i32*, i32** %structFirst, align 8, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %3 = bitcast i32* %2 to i8*, !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %4 = bitcast i32* %arraydecay to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !31
  %5 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !32
  %6 = load i32, i32* %arrayidx, align 4, !dbg !32
  call void @printIntLine(i32 %6), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !35 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data, metadata !38, metadata !DIExpression()), !dbg !39
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  %0 = load i32*, i32** %structFirst, align 8, !dbg !40
  store i32* %0, i32** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !43
  %2 = load i32*, i32** %data, align 8, !dbg !44
  %3 = bitcast i32* %2 to i8*, !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %4 = bitcast i32* %arraydecay to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !46
  %6 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 %6), !dbg !47
  ret void, !dbg !48
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!20 = !DILocation(line: 26, column: 156, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!22 = !DILocation(line: 28, column: 11, scope: !9)
!23 = !DILocation(line: 28, column: 27, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 30, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 30, column: 13, scope: !25)
!30 = !DILocation(line: 32, column: 16, scope: !25)
!31 = !DILocation(line: 32, column: 9, scope: !25)
!32 = !DILocation(line: 33, column: 22, scope: !25)
!33 = !DILocation(line: 33, column: 9, scope: !25)
!34 = !DILocation(line: 35, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "myStruct", arg: 1, scope: !35, file: !10, line: 42, type: !13)
!37 = !DILocation(line: 42, column: 160, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 44, type: !17)
!39 = !DILocation(line: 44, column: 11, scope: !35)
!40 = !DILocation(line: 44, column: 27, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !10, line: 46, type: !26)
!42 = distinct !DILexicalBlock(scope: !35, file: !10, line: 45, column: 5)
!43 = !DILocation(line: 46, column: 13, scope: !42)
!44 = !DILocation(line: 48, column: 16, scope: !42)
!45 = !DILocation(line: 48, column: 9, scope: !42)
!46 = !DILocation(line: 49, column: 22, scope: !42)
!47 = !DILocation(line: 49, column: 9, scope: !42)
!48 = !DILocation(line: 51, column: 1, scope: !35)
