; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType = type { i8* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !35, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !38
  store i64 %call, i64* %sourceLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %3 = load i64, i64* %sourceLen, align 8, !dbg !45
  %add = add i64 %3, 1, !dbg !46
  %cmp = icmp ult i64 %2, %add, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !51
  %5 = load i8, i8* %arrayidx, align 1, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !52
  store i8 %5, i8* %arrayidx1, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %9), !dbg !62
  %10 = load i8*, i8** %data, align 8, !dbg !63
  call void @free(i8* %10) #7, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !66 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType* %myStruct, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !71
  %0 = load i8*, i8** %structFirst, align 8, !dbg !71
  store i8* %0, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !79
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !80
  store i64 %call, i64* %sourceLen, align 8, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !85
  %3 = load i64, i64* %sourceLen, align 8, !dbg !87
  %add = add i64 %3, 1, !dbg !88
  %cmp = icmp ult i64 %2, %add, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !93
  %5 = load i8, i8* %arrayidx, align 1, !dbg !93
  %6 = load i8*, i8** %data, align 8, !dbg !94
  %7 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !94
  store i8 %5, i8* %arrayidx1, align 1, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %8, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %9), !dbg !103
  %10 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* %10) #7, !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType", file: !10, line: 29, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67_structType", file: !10, line: 26, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 28, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 33, type: !13)
!20 = !DILocation(line: 33, column: 140, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !17)
!22 = !DILocation(line: 35, column: 12, scope: !9)
!23 = !DILocation(line: 35, column: 28, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 37, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 37, column: 14, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 38, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 38, column: 16, scope: !25)
!35 = !DILocalVariable(name: "sourceLen", scope: !25, file: !10, line: 38, type: !31)
!36 = !DILocation(line: 38, column: 19, scope: !25)
!37 = !DILocation(line: 39, column: 28, scope: !25)
!38 = !DILocation(line: 39, column: 21, scope: !25)
!39 = !DILocation(line: 39, column: 19, scope: !25)
!40 = !DILocation(line: 42, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !25, file: !10, line: 42, column: 9)
!42 = !DILocation(line: 42, column: 14, scope: !41)
!43 = !DILocation(line: 42, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 42, column: 9)
!45 = !DILocation(line: 42, column: 25, scope: !44)
!46 = !DILocation(line: 42, column: 35, scope: !44)
!47 = !DILocation(line: 42, column: 23, scope: !44)
!48 = !DILocation(line: 42, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 30, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !10, line: 43, column: 9)
!51 = !DILocation(line: 44, column: 23, scope: !50)
!52 = !DILocation(line: 44, column: 13, scope: !50)
!53 = !DILocation(line: 44, column: 18, scope: !50)
!54 = !DILocation(line: 44, column: 21, scope: !50)
!55 = !DILocation(line: 45, column: 9, scope: !50)
!56 = !DILocation(line: 42, column: 41, scope: !44)
!57 = !DILocation(line: 42, column: 9, scope: !44)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 45, column: 9, scope: !41)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 46, column: 19, scope: !25)
!62 = !DILocation(line: 46, column: 9, scope: !25)
!63 = !DILocation(line: 47, column: 14, scope: !25)
!64 = !DILocation(line: 47, column: 9, scope: !25)
!65 = !DILocation(line: 49, column: 1, scope: !9)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_67b_goodG2BSink", scope: !10, file: !10, line: 56, type: !11, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "myStruct", arg: 1, scope: !66, file: !10, line: 56, type: !13)
!68 = !DILocation(line: 56, column: 144, scope: !66)
!69 = !DILocalVariable(name: "data", scope: !66, file: !10, line: 58, type: !17)
!70 = !DILocation(line: 58, column: 12, scope: !66)
!71 = !DILocation(line: 58, column: 28, scope: !66)
!72 = !DILocalVariable(name: "source", scope: !73, file: !10, line: 60, type: !26)
!73 = distinct !DILexicalBlock(scope: !66, file: !10, line: 59, column: 5)
!74 = !DILocation(line: 60, column: 14, scope: !73)
!75 = !DILocalVariable(name: "i", scope: !73, file: !10, line: 61, type: !31)
!76 = !DILocation(line: 61, column: 16, scope: !73)
!77 = !DILocalVariable(name: "sourceLen", scope: !73, file: !10, line: 61, type: !31)
!78 = !DILocation(line: 61, column: 19, scope: !73)
!79 = !DILocation(line: 62, column: 28, scope: !73)
!80 = !DILocation(line: 62, column: 21, scope: !73)
!81 = !DILocation(line: 62, column: 19, scope: !73)
!82 = !DILocation(line: 65, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !10, line: 65, column: 9)
!84 = !DILocation(line: 65, column: 14, scope: !83)
!85 = !DILocation(line: 65, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 65, column: 9)
!87 = !DILocation(line: 65, column: 25, scope: !86)
!88 = !DILocation(line: 65, column: 35, scope: !86)
!89 = !DILocation(line: 65, column: 23, scope: !86)
!90 = !DILocation(line: 65, column: 9, scope: !83)
!91 = !DILocation(line: 67, column: 30, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !10, line: 66, column: 9)
!93 = !DILocation(line: 67, column: 23, scope: !92)
!94 = !DILocation(line: 67, column: 13, scope: !92)
!95 = !DILocation(line: 67, column: 18, scope: !92)
!96 = !DILocation(line: 67, column: 21, scope: !92)
!97 = !DILocation(line: 68, column: 9, scope: !92)
!98 = !DILocation(line: 65, column: 41, scope: !86)
!99 = !DILocation(line: 65, column: 9, scope: !86)
!100 = distinct !{!100, !90, !101, !60}
!101 = !DILocation(line: 68, column: 9, scope: !83)
!102 = !DILocation(line: 69, column: 19, scope: !73)
!103 = !DILocation(line: 69, column: 9, scope: !73)
!104 = !DILocation(line: 70, column: 14, scope: !73)
!105 = !DILocation(line: 70, column: 9, scope: !73)
!106 = !DILocation(line: 72, column: 1, scope: !66)
