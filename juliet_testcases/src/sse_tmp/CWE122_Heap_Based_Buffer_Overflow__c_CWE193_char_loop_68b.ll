; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68_badData = external dso_local global i8*, align 8
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68_goodG2BData = external dso_local global i8*, align 8
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !29, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !31
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !32
  store i64 %call, i64* %sourceLen, align 8, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %3 = load i64, i64* %sourceLen, align 8, !dbg !39
  %add = add i64 %3, 1, !dbg !40
  %cmp = icmp ult i64 %2, %add, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !45
  %5 = load i8, i8* %arrayidx, align 1, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %7 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !46
  store i8 %5, i8* %arrayidx1, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %8, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %9), !dbg !56
  %10 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* %10) #7, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_goodG2BSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68_goodG2BData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !64, metadata !DIExpression()), !dbg !66
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %i, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !72
  store i64 %call, i64* %sourceLen, align 8, !dbg !73
  store i64 0, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !77
  %3 = load i64, i64* %sourceLen, align 8, !dbg !79
  %add = add i64 %3, 1, !dbg !80
  %cmp = icmp ult i64 %2, %add, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !85
  %5 = load i8, i8* %arrayidx, align 1, !dbg !85
  %6 = load i8*, i8** %data, align 8, !dbg !86
  %7 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !86
  store i8 %5, i8* %arrayidx1, align 1, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %8, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %9), !dbg !95
  %10 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* %10) #7, !dbg !97
  ret void, !dbg !98
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 35, column: 12, scope: !9)
!17 = !DILocation(line: 35, column: 19, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 37, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 11)
!23 = !DILocation(line: 37, column: 14, scope: !19)
!24 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 38, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 38, column: 16, scope: !19)
!29 = !DILocalVariable(name: "sourceLen", scope: !19, file: !10, line: 38, type: !25)
!30 = !DILocation(line: 38, column: 19, scope: !19)
!31 = !DILocation(line: 39, column: 28, scope: !19)
!32 = !DILocation(line: 39, column: 21, scope: !19)
!33 = !DILocation(line: 39, column: 19, scope: !19)
!34 = !DILocation(line: 42, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !19, file: !10, line: 42, column: 9)
!36 = !DILocation(line: 42, column: 14, scope: !35)
!37 = !DILocation(line: 42, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 42, column: 9)
!39 = !DILocation(line: 42, column: 25, scope: !38)
!40 = !DILocation(line: 42, column: 35, scope: !38)
!41 = !DILocation(line: 42, column: 23, scope: !38)
!42 = !DILocation(line: 42, column: 9, scope: !35)
!43 = !DILocation(line: 44, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 43, column: 9)
!45 = !DILocation(line: 44, column: 23, scope: !44)
!46 = !DILocation(line: 44, column: 13, scope: !44)
!47 = !DILocation(line: 44, column: 18, scope: !44)
!48 = !DILocation(line: 44, column: 21, scope: !44)
!49 = !DILocation(line: 45, column: 9, scope: !44)
!50 = !DILocation(line: 42, column: 41, scope: !38)
!51 = !DILocation(line: 42, column: 9, scope: !38)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 45, column: 9, scope: !35)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 46, column: 19, scope: !19)
!56 = !DILocation(line: 46, column: 9, scope: !19)
!57 = !DILocation(line: 47, column: 14, scope: !19)
!58 = !DILocation(line: 47, column: 9, scope: !19)
!59 = !DILocation(line: 49, column: 1, scope: !9)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_68b_goodG2BSink", scope: !10, file: !10, line: 56, type: !11, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !10, line: 58, type: !14)
!62 = !DILocation(line: 58, column: 12, scope: !60)
!63 = !DILocation(line: 58, column: 19, scope: !60)
!64 = !DILocalVariable(name: "source", scope: !65, file: !10, line: 60, type: !20)
!65 = distinct !DILexicalBlock(scope: !60, file: !10, line: 59, column: 5)
!66 = !DILocation(line: 60, column: 14, scope: !65)
!67 = !DILocalVariable(name: "i", scope: !65, file: !10, line: 61, type: !25)
!68 = !DILocation(line: 61, column: 16, scope: !65)
!69 = !DILocalVariable(name: "sourceLen", scope: !65, file: !10, line: 61, type: !25)
!70 = !DILocation(line: 61, column: 19, scope: !65)
!71 = !DILocation(line: 62, column: 28, scope: !65)
!72 = !DILocation(line: 62, column: 21, scope: !65)
!73 = !DILocation(line: 62, column: 19, scope: !65)
!74 = !DILocation(line: 65, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !65, file: !10, line: 65, column: 9)
!76 = !DILocation(line: 65, column: 14, scope: !75)
!77 = !DILocation(line: 65, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !10, line: 65, column: 9)
!79 = !DILocation(line: 65, column: 25, scope: !78)
!80 = !DILocation(line: 65, column: 35, scope: !78)
!81 = !DILocation(line: 65, column: 23, scope: !78)
!82 = !DILocation(line: 65, column: 9, scope: !75)
!83 = !DILocation(line: 67, column: 30, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !10, line: 66, column: 9)
!85 = !DILocation(line: 67, column: 23, scope: !84)
!86 = !DILocation(line: 67, column: 13, scope: !84)
!87 = !DILocation(line: 67, column: 18, scope: !84)
!88 = !DILocation(line: 67, column: 21, scope: !84)
!89 = !DILocation(line: 68, column: 9, scope: !84)
!90 = !DILocation(line: 65, column: 41, scope: !78)
!91 = !DILocation(line: 65, column: 9, scope: !78)
!92 = distinct !{!92, !82, !93, !54}
!93 = !DILocation(line: 68, column: 9, scope: !75)
!94 = !DILocation(line: 69, column: 19, scope: !65)
!95 = !DILocation(line: 69, column: 9, scope: !65)
!96 = !DILocation(line: 70, column: 14, scope: !65)
!97 = !DILocation(line: 70, column: 9, scope: !65)
!98 = !DILocation(line: 72, column: 1, scope: !60)
