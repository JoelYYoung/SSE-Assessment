; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType = type { i64* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b_badSink(i64* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType* %myStruct, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !27
  %0 = load i64*, i64** %structFirst, align 8, !dbg !27
  store i64* %0, i64** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %2, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !49
  %4 = load i64, i64* %arrayidx, align 8, !dbg !49
  %5 = load i64*, i64** %data, align 8, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !50
  store i64 %4, i64* %arrayidx1, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %7, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !59
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !59
  call void @printLongLongLine(i64 %9), !dbg !60
  %10 = load i64*, i64** %data, align 8, !dbg !61
  %11 = bitcast i64* %10 to i8*, !dbg !61
  call void @free(i8* %11) #5, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b_goodG2BSink(i64* %myStruct.coerce) #0 !dbg !64 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType* %myStruct, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  %0 = load i64*, i64** %structFirst, align 8, !dbg !69
  store i64* %0, i64** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !79
  %cmp = icmp ult i64 %2, 100, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !85
  %4 = load i64, i64* %arrayidx, align 8, !dbg !85
  %5 = load i64*, i64** %data, align 8, !dbg !86
  %6 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !86
  store i64 %4, i64* %arrayidx1, align 8, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %7, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !94
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !94
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !94
  call void @printLongLongLine(i64 %9), !dbg !95
  %10 = load i64*, i64** %data, align 8, !dbg !96
  %11 = bitcast i64* %10 to i8*, !dbg !96
  call void @free(i8* %11) #5, !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 27, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !21, line: 44, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!23 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!24 = !DILocation(line: 26, column: 146, scope: !9)
!25 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!26 = !DILocation(line: 28, column: 15, scope: !9)
!27 = !DILocation(line: 28, column: 31, scope: !9)
!28 = !DILocalVariable(name: "source", scope: !29, file: !10, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 30, column: 17, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !10, line: 32, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 31, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 32, column: 20, scope: !35)
!40 = !DILocation(line: 34, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !10, line: 34, column: 13)
!42 = !DILocation(line: 34, column: 18, scope: !41)
!43 = !DILocation(line: 34, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 34, column: 13)
!45 = !DILocation(line: 34, column: 27, scope: !44)
!46 = !DILocation(line: 34, column: 13, scope: !41)
!47 = !DILocation(line: 36, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !10, line: 35, column: 13)
!49 = !DILocation(line: 36, column: 27, scope: !48)
!50 = !DILocation(line: 36, column: 17, scope: !48)
!51 = !DILocation(line: 36, column: 22, scope: !48)
!52 = !DILocation(line: 36, column: 25, scope: !48)
!53 = !DILocation(line: 37, column: 13, scope: !48)
!54 = !DILocation(line: 34, column: 35, scope: !44)
!55 = !DILocation(line: 34, column: 13, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 37, column: 13, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 38, column: 31, scope: !35)
!60 = !DILocation(line: 38, column: 13, scope: !35)
!61 = !DILocation(line: 39, column: 18, scope: !35)
!62 = !DILocation(line: 39, column: 13, scope: !35)
!63 = !DILocation(line: 42, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_67b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "myStruct", arg: 1, scope: !64, file: !10, line: 49, type: !13)
!66 = !DILocation(line: 49, column: 150, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 51, type: !17)
!68 = !DILocation(line: 51, column: 15, scope: !64)
!69 = !DILocation(line: 51, column: 31, scope: !64)
!70 = !DILocalVariable(name: "source", scope: !71, file: !10, line: 53, type: !30)
!71 = distinct !DILexicalBlock(scope: !64, file: !10, line: 52, column: 5)
!72 = !DILocation(line: 53, column: 17, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !74, file: !10, line: 55, type: !36)
!74 = distinct !DILexicalBlock(scope: !71, file: !10, line: 54, column: 9)
!75 = !DILocation(line: 55, column: 20, scope: !74)
!76 = !DILocation(line: 57, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !10, line: 57, column: 13)
!78 = !DILocation(line: 57, column: 18, scope: !77)
!79 = !DILocation(line: 57, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 57, column: 13)
!81 = !DILocation(line: 57, column: 27, scope: !80)
!82 = !DILocation(line: 57, column: 13, scope: !77)
!83 = !DILocation(line: 59, column: 34, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 58, column: 13)
!85 = !DILocation(line: 59, column: 27, scope: !84)
!86 = !DILocation(line: 59, column: 17, scope: !84)
!87 = !DILocation(line: 59, column: 22, scope: !84)
!88 = !DILocation(line: 59, column: 25, scope: !84)
!89 = !DILocation(line: 60, column: 13, scope: !84)
!90 = !DILocation(line: 57, column: 35, scope: !80)
!91 = !DILocation(line: 57, column: 13, scope: !80)
!92 = distinct !{!92, !82, !93, !58}
!93 = !DILocation(line: 60, column: 13, scope: !77)
!94 = !DILocation(line: 61, column: 31, scope: !74)
!95 = !DILocation(line: 61, column: 13, scope: !74)
!96 = !DILocation(line: 62, column: 18, scope: !74)
!97 = !DILocation(line: 62, column: 13, scope: !74)
!98 = !DILocation(line: 65, column: 1, scope: !64)
