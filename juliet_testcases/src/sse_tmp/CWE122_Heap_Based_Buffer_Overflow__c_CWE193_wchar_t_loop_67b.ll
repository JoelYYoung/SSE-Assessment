; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType = type { i32* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_badSink.source to i8*), i64 44, i1 false), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !36, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !38
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !39
  store i64 %call, i64* %sourceLen, align 8, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !44
  %3 = load i64, i64* %sourceLen, align 8, !dbg !46
  %add = add i64 %3, 1, !dbg !47
  %cmp = icmp ult i64 %2, %add, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !52
  %5 = load i32, i32* %arrayidx, align 4, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !53
  store i32 %5, i32* %arrayidx1, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %8, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !62
  call void @printWLine(i32* %9), !dbg !63
  %10 = load i32*, i32** %data, align 8, !dbg !64
  %11 = bitcast i32* %10 to i8*, !dbg !64
  call void @free(i8* %11) #7, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !67 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType* %myStruct, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !72
  %0 = load i32*, i32** %structFirst, align 8, !dbg !72
  store i32* %0, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !73, metadata !DIExpression()), !dbg !75
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !80
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !81
  store i64 %call, i64* %sourceLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !86
  %3 = load i64, i64* %sourceLen, align 8, !dbg !88
  %add = add i64 %3, 1, !dbg !89
  %cmp = icmp ult i64 %2, %add, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !94
  %5 = load i32, i32* %arrayidx, align 4, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %7 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !95
  store i32 %5, i32* %arrayidx1, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %8, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %9), !dbg !104
  %10 = load i32*, i32** %data, align 8, !dbg !105
  %11 = bitcast i32* %10 to i8*, !dbg !105
  call void @free(i8* %11) #7, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType", file: !10, line: 29, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67_structType", file: !10, line: 26, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 28, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 33, type: !13)
!22 = !DILocation(line: 33, column: 146, scope: !9)
!23 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !17)
!24 = !DILocation(line: 35, column: 15, scope: !9)
!25 = !DILocation(line: 35, column: 31, scope: !9)
!26 = !DILocalVariable(name: "source", scope: !27, file: !10, line: 37, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 37, column: 17, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !27, file: !10, line: 38, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !19, line: 46, baseType: !34)
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 38, column: 16, scope: !27)
!36 = !DILocalVariable(name: "sourceLen", scope: !27, file: !10, line: 38, type: !33)
!37 = !DILocation(line: 38, column: 19, scope: !27)
!38 = !DILocation(line: 39, column: 28, scope: !27)
!39 = !DILocation(line: 39, column: 21, scope: !27)
!40 = !DILocation(line: 39, column: 19, scope: !27)
!41 = !DILocation(line: 42, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !27, file: !10, line: 42, column: 9)
!43 = !DILocation(line: 42, column: 14, scope: !42)
!44 = !DILocation(line: 42, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !10, line: 42, column: 9)
!46 = !DILocation(line: 42, column: 25, scope: !45)
!47 = !DILocation(line: 42, column: 35, scope: !45)
!48 = !DILocation(line: 42, column: 23, scope: !45)
!49 = !DILocation(line: 42, column: 9, scope: !42)
!50 = !DILocation(line: 44, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !10, line: 43, column: 9)
!52 = !DILocation(line: 44, column: 23, scope: !51)
!53 = !DILocation(line: 44, column: 13, scope: !51)
!54 = !DILocation(line: 44, column: 18, scope: !51)
!55 = !DILocation(line: 44, column: 21, scope: !51)
!56 = !DILocation(line: 45, column: 9, scope: !51)
!57 = !DILocation(line: 42, column: 41, scope: !45)
!58 = !DILocation(line: 42, column: 9, scope: !45)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 45, column: 9, scope: !42)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 46, column: 20, scope: !27)
!63 = !DILocation(line: 46, column: 9, scope: !27)
!64 = !DILocation(line: 47, column: 14, scope: !27)
!65 = !DILocation(line: 47, column: 9, scope: !27)
!66 = !DILocation(line: 49, column: 1, scope: !9)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_67b_goodG2BSink", scope: !10, file: !10, line: 56, type: !11, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "myStruct", arg: 1, scope: !67, file: !10, line: 56, type: !13)
!69 = !DILocation(line: 56, column: 150, scope: !67)
!70 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 58, type: !17)
!71 = !DILocation(line: 58, column: 15, scope: !67)
!72 = !DILocation(line: 58, column: 31, scope: !67)
!73 = !DILocalVariable(name: "source", scope: !74, file: !10, line: 60, type: !28)
!74 = distinct !DILexicalBlock(scope: !67, file: !10, line: 59, column: 5)
!75 = !DILocation(line: 60, column: 17, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !74, file: !10, line: 61, type: !33)
!77 = !DILocation(line: 61, column: 16, scope: !74)
!78 = !DILocalVariable(name: "sourceLen", scope: !74, file: !10, line: 61, type: !33)
!79 = !DILocation(line: 61, column: 19, scope: !74)
!80 = !DILocation(line: 62, column: 28, scope: !74)
!81 = !DILocation(line: 62, column: 21, scope: !74)
!82 = !DILocation(line: 62, column: 19, scope: !74)
!83 = !DILocation(line: 65, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !10, line: 65, column: 9)
!85 = !DILocation(line: 65, column: 14, scope: !84)
!86 = !DILocation(line: 65, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 65, column: 9)
!88 = !DILocation(line: 65, column: 25, scope: !87)
!89 = !DILocation(line: 65, column: 35, scope: !87)
!90 = !DILocation(line: 65, column: 23, scope: !87)
!91 = !DILocation(line: 65, column: 9, scope: !84)
!92 = !DILocation(line: 67, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !10, line: 66, column: 9)
!94 = !DILocation(line: 67, column: 23, scope: !93)
!95 = !DILocation(line: 67, column: 13, scope: !93)
!96 = !DILocation(line: 67, column: 18, scope: !93)
!97 = !DILocation(line: 67, column: 21, scope: !93)
!98 = !DILocation(line: 68, column: 9, scope: !93)
!99 = !DILocation(line: 65, column: 41, scope: !87)
!100 = !DILocation(line: 65, column: 9, scope: !87)
!101 = distinct !{!101, !91, !102, !61}
!102 = !DILocation(line: 68, column: 9, scope: !84)
!103 = !DILocation(line: 69, column: 20, scope: !74)
!104 = !DILocation(line: 69, column: 9, scope: !74)
!105 = !DILocation(line: 70, column: 14, scope: !74)
!106 = !DILocation(line: 70, column: 9, scope: !74)
!107 = !DILocation(line: 72, column: 1, scope: !67)
