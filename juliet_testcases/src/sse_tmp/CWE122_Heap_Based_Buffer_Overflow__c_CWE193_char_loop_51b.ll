; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !28, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !30
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !31
  store i64 %call, i64* %sourceLen, align 8, !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !36
  %2 = load i64, i64* %sourceLen, align 8, !dbg !38
  %add = add i64 %2, 1, !dbg !39
  %cmp = icmp ult i64 %1, %add, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !44
  %4 = load i8, i8* %arrayidx, align 1, !dbg !44
  %5 = load i8*, i8** %data.addr, align 8, !dbg !45
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !45
  store i8 %4, i8* %arrayidx1, align 1, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %7, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @printLine(i8* %8), !dbg !55
  %9 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @free(i8* %9) #7, !dbg !57
  ret void, !dbg !58
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_goodG2BSink(i8* %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !62, metadata !DIExpression()), !dbg !64
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !69
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !70
  store i64 %call, i64* %sourceLen, align 8, !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !75
  %2 = load i64, i64* %sourceLen, align 8, !dbg !77
  %add = add i64 %2, 1, !dbg !78
  %cmp = icmp ult i64 %1, %add, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !83
  %4 = load i8, i8* %arrayidx, align 1, !dbg !83
  %5 = load i8*, i8** %data.addr, align 8, !dbg !84
  %6 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !84
  store i8 %4, i8* %arrayidx1, align 1, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %7, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !92
  call void @printLine(i8* %8), !dbg !93
  %9 = load i8*, i8** %data.addr, align 8, !dbg !94
  call void @free(i8* %9) #7, !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_badSink", scope: !10, file: !10, line: 30, type: !11, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 30, type: !13)
!16 = !DILocation(line: 30, column: 79, scope: !9)
!17 = !DILocalVariable(name: "source", scope: !18, file: !10, line: 33, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 88, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 11)
!22 = !DILocation(line: 33, column: 14, scope: !18)
!23 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 34, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 34, column: 16, scope: !18)
!28 = !DILocalVariable(name: "sourceLen", scope: !18, file: !10, line: 34, type: !24)
!29 = !DILocation(line: 34, column: 19, scope: !18)
!30 = !DILocation(line: 35, column: 28, scope: !18)
!31 = !DILocation(line: 35, column: 21, scope: !18)
!32 = !DILocation(line: 35, column: 19, scope: !18)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 9)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 38, column: 9)
!38 = !DILocation(line: 38, column: 25, scope: !37)
!39 = !DILocation(line: 38, column: 35, scope: !37)
!40 = !DILocation(line: 38, column: 23, scope: !37)
!41 = !DILocation(line: 38, column: 9, scope: !34)
!42 = !DILocation(line: 40, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !10, line: 39, column: 9)
!44 = !DILocation(line: 40, column: 23, scope: !43)
!45 = !DILocation(line: 40, column: 13, scope: !43)
!46 = !DILocation(line: 40, column: 18, scope: !43)
!47 = !DILocation(line: 40, column: 21, scope: !43)
!48 = !DILocation(line: 41, column: 9, scope: !43)
!49 = !DILocation(line: 38, column: 41, scope: !37)
!50 = !DILocation(line: 38, column: 9, scope: !37)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 41, column: 9, scope: !34)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 42, column: 19, scope: !18)
!55 = !DILocation(line: 42, column: 9, scope: !18)
!56 = !DILocation(line: 43, column: 14, scope: !18)
!57 = !DILocation(line: 43, column: 9, scope: !18)
!58 = !DILocation(line: 45, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_51b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !10, line: 52, type: !13)
!61 = !DILocation(line: 52, column: 83, scope: !59)
!62 = !DILocalVariable(name: "source", scope: !63, file: !10, line: 55, type: !19)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 54, column: 5)
!64 = !DILocation(line: 55, column: 14, scope: !63)
!65 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 56, type: !24)
!66 = !DILocation(line: 56, column: 16, scope: !63)
!67 = !DILocalVariable(name: "sourceLen", scope: !63, file: !10, line: 56, type: !24)
!68 = !DILocation(line: 56, column: 19, scope: !63)
!69 = !DILocation(line: 57, column: 28, scope: !63)
!70 = !DILocation(line: 57, column: 21, scope: !63)
!71 = !DILocation(line: 57, column: 19, scope: !63)
!72 = !DILocation(line: 60, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !10, line: 60, column: 9)
!74 = !DILocation(line: 60, column: 14, scope: !73)
!75 = !DILocation(line: 60, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 60, column: 9)
!77 = !DILocation(line: 60, column: 25, scope: !76)
!78 = !DILocation(line: 60, column: 35, scope: !76)
!79 = !DILocation(line: 60, column: 23, scope: !76)
!80 = !DILocation(line: 60, column: 9, scope: !73)
!81 = !DILocation(line: 62, column: 30, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !10, line: 61, column: 9)
!83 = !DILocation(line: 62, column: 23, scope: !82)
!84 = !DILocation(line: 62, column: 13, scope: !82)
!85 = !DILocation(line: 62, column: 18, scope: !82)
!86 = !DILocation(line: 62, column: 21, scope: !82)
!87 = !DILocation(line: 63, column: 9, scope: !82)
!88 = !DILocation(line: 60, column: 41, scope: !76)
!89 = !DILocation(line: 60, column: 9, scope: !76)
!90 = distinct !{!90, !80, !91, !53}
!91 = !DILocation(line: 63, column: 9, scope: !73)
!92 = !DILocation(line: 64, column: 19, scope: !63)
!93 = !DILocation(line: 64, column: 9, scope: !63)
!94 = !DILocation(line: 65, column: 14, scope: !63)
!95 = !DILocation(line: 65, column: 9, scope: !63)
!96 = !DILocation(line: 67, column: 1, scope: !59)
