; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !28
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !32
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay1, i64 99) #5, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %4), !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* %5) #5, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !41 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !46
  %1 = load i8*, i8** %0, align 8, !dbg !47
  store i8* %1, i8** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %2 = load i8*, i8** %data, align 8, !dbg !54
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay1, i64 99) #5, !dbg !56
  %3 = load i8*, i8** %data, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !57
  store i8 0, i8* %arrayidx2, align 1, !dbg !58
  %4 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %4), !dbg !60
  %5 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %5) #5, !dbg !62
  ret void, !dbg !63
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 81, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!19 = !DILocation(line: 25, column: 12, scope: !9)
!20 = !DILocation(line: 25, column: 20, scope: !9)
!21 = !DILocation(line: 25, column: 19, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 27, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 27, column: 14, scope: !23)
!28 = !DILocation(line: 28, column: 9, scope: !23)
!29 = !DILocation(line: 29, column: 9, scope: !23)
!30 = !DILocation(line: 29, column: 23, scope: !23)
!31 = !DILocation(line: 31, column: 17, scope: !23)
!32 = !DILocation(line: 31, column: 23, scope: !23)
!33 = !DILocation(line: 31, column: 9, scope: !23)
!34 = !DILocation(line: 32, column: 9, scope: !23)
!35 = !DILocation(line: 32, column: 21, scope: !23)
!36 = !DILocation(line: 33, column: 19, scope: !23)
!37 = !DILocation(line: 33, column: 9, scope: !23)
!38 = !DILocation(line: 34, column: 14, scope: !23)
!39 = !DILocation(line: 34, column: 9, scope: !23)
!40 = !DILocation(line: 36, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_63b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !41, file: !10, line: 43, type: !13)
!43 = !DILocation(line: 43, column: 85, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !10, line: 45, type: !14)
!45 = !DILocation(line: 45, column: 12, scope: !41)
!46 = !DILocation(line: 45, column: 20, scope: !41)
!47 = !DILocation(line: 45, column: 19, scope: !41)
!48 = !DILocalVariable(name: "source", scope: !49, file: !10, line: 47, type: !24)
!49 = distinct !DILexicalBlock(scope: !41, file: !10, line: 46, column: 5)
!50 = !DILocation(line: 47, column: 14, scope: !49)
!51 = !DILocation(line: 48, column: 9, scope: !49)
!52 = !DILocation(line: 49, column: 9, scope: !49)
!53 = !DILocation(line: 49, column: 23, scope: !49)
!54 = !DILocation(line: 51, column: 17, scope: !49)
!55 = !DILocation(line: 51, column: 23, scope: !49)
!56 = !DILocation(line: 51, column: 9, scope: !49)
!57 = !DILocation(line: 52, column: 9, scope: !49)
!58 = !DILocation(line: 52, column: 21, scope: !49)
!59 = !DILocation(line: 53, column: 19, scope: !49)
!60 = !DILocation(line: 53, column: 9, scope: !49)
!61 = !DILocation(line: 54, column: 14, scope: !49)
!62 = !DILocation(line: 54, column: 9, scope: !49)
!63 = !DILocation(line: 56, column: 1, scope: !41)
