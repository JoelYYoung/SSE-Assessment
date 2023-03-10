; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i8**, !dbg !23
  store i8** %1, i8*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !26
  %3 = load i8*, i8** %2, align 8, !dbg !27
  store i8* %3, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* %6), !dbg !38
  %7 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* %7) #5, !dbg !40
  ret void, !dbg !41
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !42 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !47
  %1 = bitcast i8* %0 to i8**, !dbg !48
  store i8** %1, i8*** %dataPtr, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !51
  %3 = load i8*, i8** %2, align 8, !dbg !52
  store i8* %3, i8** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !53, metadata !DIExpression()), !dbg !55
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !58
  %6 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %6), !dbg !60
  %7 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %7) #5, !dbg !62
  ret void, !dbg !63
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 23, type: !17)
!19 = !DILocation(line: 23, column: 75, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 14, scope: !13)
!22 = !DILocation(line: 26, column: 34, scope: !13)
!23 = !DILocation(line: 26, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !5)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 21, scope: !13)
!27 = !DILocation(line: 28, column: 20, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 30, column: 14, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 22, scope: !29)
!36 = !DILocation(line: 32, column: 9, scope: !29)
!37 = !DILocation(line: 33, column: 19, scope: !29)
!38 = !DILocation(line: 33, column: 9, scope: !29)
!39 = !DILocation(line: 34, column: 14, scope: !29)
!40 = !DILocation(line: 34, column: 9, scope: !29)
!41 = !DILocation(line: 36, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_64b_goodG2BSink", scope: !14, file: !14, line: 43, type: !15, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !42, file: !14, line: 43, type: !17)
!44 = !DILocation(line: 43, column: 79, scope: !42)
!45 = !DILocalVariable(name: "dataPtr", scope: !42, file: !14, line: 46, type: !4)
!46 = !DILocation(line: 46, column: 14, scope: !42)
!47 = !DILocation(line: 46, column: 34, scope: !42)
!48 = !DILocation(line: 46, column: 24, scope: !42)
!49 = !DILocalVariable(name: "data", scope: !42, file: !14, line: 48, type: !5)
!50 = !DILocation(line: 48, column: 12, scope: !42)
!51 = !DILocation(line: 48, column: 21, scope: !42)
!52 = !DILocation(line: 48, column: 20, scope: !42)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !14, line: 50, type: !30)
!54 = distinct !DILexicalBlock(scope: !42, file: !14, line: 49, column: 5)
!55 = !DILocation(line: 50, column: 14, scope: !54)
!56 = !DILocation(line: 52, column: 16, scope: !54)
!57 = !DILocation(line: 52, column: 22, scope: !54)
!58 = !DILocation(line: 52, column: 9, scope: !54)
!59 = !DILocation(line: 53, column: 19, scope: !54)
!60 = !DILocation(line: 53, column: 9, scope: !54)
!61 = !DILocation(line: 54, column: 14, scope: !54)
!62 = !DILocation(line: 54, column: 9, scope: !54)
!63 = !DILocation(line: 56, column: 1, scope: !42)
