; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %call = call i8* @strcat(i8* %arraydecay, i8* %3) #5, !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !30
  call void @printLine(i8* %4), !dbg !31
  %5 = load i8*, i8** %data, align 8, !dbg !32
  call void @free(i8* %5) #5, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_goodG2BSink(i8** %dataArray) #0 !dbg !35 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !40
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !40
  store i8* %1, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !43
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i8* @strcat(i8* %arraydecay, i8* %3) #5, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %4), !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* %5) #5, !dbg !50
  ret void, !dbg !51
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 75, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!19 = !DILocation(line: 26, column: 12, scope: !9)
!20 = !DILocation(line: 26, column: 19, scope: !9)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !10, line: 28, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 28, column: 14, scope: !22)
!27 = !DILocation(line: 30, column: 16, scope: !22)
!28 = !DILocation(line: 30, column: 22, scope: !22)
!29 = !DILocation(line: 30, column: 9, scope: !22)
!30 = !DILocation(line: 31, column: 19, scope: !22)
!31 = !DILocation(line: 31, column: 9, scope: !22)
!32 = !DILocation(line: 32, column: 14, scope: !22)
!33 = !DILocation(line: 32, column: 9, scope: !22)
!34 = !DILocation(line: 34, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_goodG2BSink", scope: !10, file: !10, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "dataArray", arg: 1, scope: !35, file: !10, line: 41, type: !13)
!37 = !DILocation(line: 41, column: 79, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 43, type: !14)
!39 = !DILocation(line: 43, column: 12, scope: !35)
!40 = !DILocation(line: 43, column: 19, scope: !35)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 45, type: !23)
!42 = distinct !DILexicalBlock(scope: !35, file: !10, line: 44, column: 5)
!43 = !DILocation(line: 45, column: 14, scope: !42)
!44 = !DILocation(line: 47, column: 16, scope: !42)
!45 = !DILocation(line: 47, column: 22, scope: !42)
!46 = !DILocation(line: 47, column: 9, scope: !42)
!47 = !DILocation(line: 48, column: 19, scope: !42)
!48 = !DILocation(line: 48, column: 9, scope: !42)
!49 = !DILocation(line: 49, column: 14, scope: !42)
!50 = !DILocation(line: 49, column: 9, scope: !42)
!51 = !DILocation(line: 51, column: 1, scope: !35)