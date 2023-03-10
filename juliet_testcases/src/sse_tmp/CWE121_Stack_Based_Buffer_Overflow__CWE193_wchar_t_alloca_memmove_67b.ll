; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_badSink.source to i8*), i64 44, i1 false), !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %3 = bitcast i32* %2 to i8*, !dbg !33
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !33
  %4 = bitcast i32* %arraydecay to i8*, !dbg !33
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !34
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !35
  %add = add i64 %call, 1, !dbg !36
  %mul = mul i64 %add, 4, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !38
  call void @printWLine(i32* %5), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !41 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType* %myStruct, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !46
  %0 = load i32*, i32** %structFirst, align 8, !dbg !46
  store i32* %0, i32** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !49
  %2 = load i32*, i32** %data, align 8, !dbg !50
  %3 = bitcast i32* %2 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %4 = bitcast i32* %arraydecay to i8*, !dbg !51
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !53
  %add = add i64 %call, 1, !dbg !54
  %mul = mul i64 %add, 4, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %5), !dbg !57
  ret void, !dbg !58
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType", file: !10, line: 29, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67_structType", file: !10, line: 26, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 28, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 33, type: !13)
!22 = !DILocation(line: 33, column: 164, scope: !9)
!23 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !17)
!24 = !DILocation(line: 35, column: 15, scope: !9)
!25 = !DILocation(line: 35, column: 31, scope: !9)
!26 = !DILocalVariable(name: "source", scope: !27, file: !10, line: 37, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 37, column: 17, scope: !27)
!32 = !DILocation(line: 40, column: 17, scope: !27)
!33 = !DILocation(line: 40, column: 9, scope: !27)
!34 = !DILocation(line: 40, column: 39, scope: !27)
!35 = !DILocation(line: 40, column: 32, scope: !27)
!36 = !DILocation(line: 40, column: 47, scope: !27)
!37 = !DILocation(line: 40, column: 52, scope: !27)
!38 = !DILocation(line: 41, column: 20, scope: !27)
!39 = !DILocation(line: 41, column: 9, scope: !27)
!40 = !DILocation(line: 43, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_67b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "myStruct", arg: 1, scope: !41, file: !10, line: 50, type: !13)
!43 = !DILocation(line: 50, column: 168, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !10, line: 52, type: !17)
!45 = !DILocation(line: 52, column: 15, scope: !41)
!46 = !DILocation(line: 52, column: 31, scope: !41)
!47 = !DILocalVariable(name: "source", scope: !48, file: !10, line: 54, type: !28)
!48 = distinct !DILexicalBlock(scope: !41, file: !10, line: 53, column: 5)
!49 = !DILocation(line: 54, column: 17, scope: !48)
!50 = !DILocation(line: 57, column: 17, scope: !48)
!51 = !DILocation(line: 57, column: 9, scope: !48)
!52 = !DILocation(line: 57, column: 39, scope: !48)
!53 = !DILocation(line: 57, column: 32, scope: !48)
!54 = !DILocation(line: 57, column: 47, scope: !48)
!55 = !DILocation(line: 57, column: 52, scope: !48)
!56 = !DILocation(line: 58, column: 20, scope: !48)
!57 = !DILocation(line: 58, column: 9, scope: !48)
!58 = !DILocation(line: 60, column: 1, scope: !41)
