; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !35
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !36
  store i64 %call, i64* %sourceLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !41
  %4 = load i64, i64* %sourceLen, align 8, !dbg !43
  %add = add i64 %4, 1, !dbg !44
  %cmp = icmp ult i64 %3, %add, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !49
  %6 = load i8, i8* %arrayidx, align 1, !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  %8 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !50
  store i8 %6, i8* %arrayidx1, align 1, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %9, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %10), !dbg !60
  %11 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %11) #7, !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !64 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !69
  %1 = load i8*, i8** %0, align 8, !dbg !70
  store i8* %1, i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !71, metadata !DIExpression()), !dbg !73
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !78
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !79
  store i64 %call, i64* %sourceLen, align 8, !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !84
  %4 = load i64, i64* %sourceLen, align 8, !dbg !86
  %add = add i64 %4, 1, !dbg !87
  %cmp = icmp ult i64 %3, %add, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !92
  %6 = load i8, i8* %arrayidx, align 1, !dbg !92
  %7 = load i8*, i8** %data, align 8, !dbg !93
  %8 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !93
  store i8 %6, i8* %arrayidx1, align 1, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %9, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %10), !dbg !102
  %11 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* %11) #7, !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!17 = !DILocation(line: 28, column: 81, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!19 = !DILocation(line: 30, column: 12, scope: !9)
!20 = !DILocation(line: 30, column: 20, scope: !9)
!21 = !DILocation(line: 30, column: 19, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 32, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 11)
!27 = !DILocation(line: 32, column: 14, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 33, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 33, column: 16, scope: !23)
!33 = !DILocalVariable(name: "sourceLen", scope: !23, file: !10, line: 33, type: !29)
!34 = !DILocation(line: 33, column: 19, scope: !23)
!35 = !DILocation(line: 34, column: 28, scope: !23)
!36 = !DILocation(line: 34, column: 21, scope: !23)
!37 = !DILocation(line: 34, column: 19, scope: !23)
!38 = !DILocation(line: 37, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !23, file: !10, line: 37, column: 9)
!40 = !DILocation(line: 37, column: 14, scope: !39)
!41 = !DILocation(line: 37, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 37, column: 9)
!43 = !DILocation(line: 37, column: 25, scope: !42)
!44 = !DILocation(line: 37, column: 35, scope: !42)
!45 = !DILocation(line: 37, column: 23, scope: !42)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 30, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !10, line: 38, column: 9)
!49 = !DILocation(line: 39, column: 23, scope: !48)
!50 = !DILocation(line: 39, column: 13, scope: !48)
!51 = !DILocation(line: 39, column: 18, scope: !48)
!52 = !DILocation(line: 39, column: 21, scope: !48)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 37, column: 41, scope: !42)
!55 = !DILocation(line: 37, column: 9, scope: !42)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 40, column: 9, scope: !39)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 41, column: 19, scope: !23)
!60 = !DILocation(line: 41, column: 9, scope: !23)
!61 = !DILocation(line: 42, column: 14, scope: !23)
!62 = !DILocation(line: 42, column: 9, scope: !23)
!63 = !DILocation(line: 44, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_63b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !64, file: !10, line: 51, type: !13)
!66 = !DILocation(line: 51, column: 85, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 53, type: !14)
!68 = !DILocation(line: 53, column: 12, scope: !64)
!69 = !DILocation(line: 53, column: 20, scope: !64)
!70 = !DILocation(line: 53, column: 19, scope: !64)
!71 = !DILocalVariable(name: "source", scope: !72, file: !10, line: 55, type: !24)
!72 = distinct !DILexicalBlock(scope: !64, file: !10, line: 54, column: 5)
!73 = !DILocation(line: 55, column: 14, scope: !72)
!74 = !DILocalVariable(name: "i", scope: !72, file: !10, line: 56, type: !29)
!75 = !DILocation(line: 56, column: 16, scope: !72)
!76 = !DILocalVariable(name: "sourceLen", scope: !72, file: !10, line: 56, type: !29)
!77 = !DILocation(line: 56, column: 19, scope: !72)
!78 = !DILocation(line: 57, column: 28, scope: !72)
!79 = !DILocation(line: 57, column: 21, scope: !72)
!80 = !DILocation(line: 57, column: 19, scope: !72)
!81 = !DILocation(line: 60, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !10, line: 60, column: 9)
!83 = !DILocation(line: 60, column: 14, scope: !82)
!84 = !DILocation(line: 60, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 60, column: 9)
!86 = !DILocation(line: 60, column: 25, scope: !85)
!87 = !DILocation(line: 60, column: 35, scope: !85)
!88 = !DILocation(line: 60, column: 23, scope: !85)
!89 = !DILocation(line: 60, column: 9, scope: !82)
!90 = !DILocation(line: 62, column: 30, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !10, line: 61, column: 9)
!92 = !DILocation(line: 62, column: 23, scope: !91)
!93 = !DILocation(line: 62, column: 13, scope: !91)
!94 = !DILocation(line: 62, column: 18, scope: !91)
!95 = !DILocation(line: 62, column: 21, scope: !91)
!96 = !DILocation(line: 63, column: 9, scope: !91)
!97 = !DILocation(line: 60, column: 41, scope: !85)
!98 = !DILocation(line: 60, column: 9, scope: !85)
!99 = distinct !{!99, !89, !100, !58}
!100 = !DILocation(line: 63, column: 9, scope: !82)
!101 = !DILocation(line: 64, column: 19, scope: !72)
!102 = !DILocation(line: 64, column: 9, scope: !72)
!103 = !DILocation(line: 65, column: 14, scope: !72)
!104 = !DILocation(line: 65, column: 9, scope: !72)
!105 = !DILocation(line: 67, column: 1, scope: !64)
