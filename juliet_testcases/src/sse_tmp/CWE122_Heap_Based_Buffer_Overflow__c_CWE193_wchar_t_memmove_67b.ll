; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType = type { i32* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_badSink.source to i8*), i64 44, i1 false), !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %3 = bitcast i32* %2 to i8*, !dbg !33
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !33
  %4 = bitcast i32* %arraydecay to i8*, !dbg !33
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !34
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !35
  %add = add i64 %call, 1, !dbg !36
  %mul = mul i64 %add, 4, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !38
  call void @printWLine(i32* %5), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %7 = bitcast i32* %6 to i8*, !dbg !40
  call void @free(i8* %7) #7, !dbg !41
  ret void, !dbg !42
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

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !43 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType* %myStruct, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !48
  %0 = load i32*, i32** %structFirst, align 8, !dbg !48
  store i32* %0, i32** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !51
  %2 = load i32*, i32** %data, align 8, !dbg !52
  %3 = bitcast i32* %2 to i8*, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %4 = bitcast i32* %arraydecay to i8*, !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !55
  %add = add i64 %call, 1, !dbg !56
  %mul = mul i64 %add, 4, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %5), !dbg !59
  %6 = load i32*, i32** %data, align 8, !dbg !60
  %7 = bitcast i32* %6 to i8*, !dbg !60
  call void @free(i8* %7) #7, !dbg !61
  ret void, !dbg !62
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType", file: !10, line: 29, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67_structType", file: !10, line: 26, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 28, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 33, type: !13)
!22 = !DILocation(line: 33, column: 152, scope: !9)
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
!40 = !DILocation(line: 42, column: 14, scope: !27)
!41 = !DILocation(line: 42, column: 9, scope: !27)
!42 = !DILocation(line: 44, column: 1, scope: !9)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_67b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "myStruct", arg: 1, scope: !43, file: !10, line: 51, type: !13)
!45 = !DILocation(line: 51, column: 156, scope: !43)
!46 = !DILocalVariable(name: "data", scope: !43, file: !10, line: 53, type: !17)
!47 = !DILocation(line: 53, column: 15, scope: !43)
!48 = !DILocation(line: 53, column: 31, scope: !43)
!49 = !DILocalVariable(name: "source", scope: !50, file: !10, line: 55, type: !28)
!50 = distinct !DILexicalBlock(scope: !43, file: !10, line: 54, column: 5)
!51 = !DILocation(line: 55, column: 17, scope: !50)
!52 = !DILocation(line: 58, column: 17, scope: !50)
!53 = !DILocation(line: 58, column: 9, scope: !50)
!54 = !DILocation(line: 58, column: 39, scope: !50)
!55 = !DILocation(line: 58, column: 32, scope: !50)
!56 = !DILocation(line: 58, column: 47, scope: !50)
!57 = !DILocation(line: 58, column: 52, scope: !50)
!58 = !DILocation(line: 59, column: 20, scope: !50)
!59 = !DILocation(line: 59, column: 9, scope: !50)
!60 = !DILocation(line: 60, column: 14, scope: !50)
!61 = !DILocation(line: 60, column: 9, scope: !50)
!62 = !DILocation(line: 62, column: 1, scope: !43)
