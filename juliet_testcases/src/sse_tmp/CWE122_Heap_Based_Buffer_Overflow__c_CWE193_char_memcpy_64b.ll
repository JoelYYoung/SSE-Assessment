; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
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
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !33
  %5 = load i8*, i8** %data, align 8, !dbg !34
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !35
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !37
  %add = add i64 %call, 1, !dbg !38
  %mul = mul i64 %add, 1, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !35
  %6 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %6), !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  call void @free(i8* %7) #7, !dbg !43
  ret void, !dbg !44
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !45 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !50
  %1 = bitcast i8* %0 to i8**, !dbg !51
  store i8** %1, i8*** %dataPtr, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i8** %data, metadata !52, metadata !DIExpression()), !dbg !53
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !54
  %3 = load i8*, i8** %2, align 8, !dbg !55
  store i8* %3, i8** %data, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !58
  %5 = load i8*, i8** %data, align 8, !dbg !59
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !60
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !62
  %add = add i64 %call, 1, !dbg !63
  %mul = mul i64 %add, 1, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %6), !dbg !66
  %7 = load i8*, i8** %data, align 8, !dbg !67
  call void @free(i8* %7) #7, !dbg !68
  ret void, !dbg !69
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 28, type: !17)
!19 = !DILocation(line: 28, column: 81, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 14, scope: !13)
!22 = !DILocation(line: 31, column: 34, scope: !13)
!23 = !DILocation(line: 31, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !5)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 21, scope: !13)
!27 = !DILocation(line: 33, column: 20, scope: !13)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 35, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 35, column: 14, scope: !29)
!34 = !DILocation(line: 38, column: 16, scope: !29)
!35 = !DILocation(line: 38, column: 9, scope: !29)
!36 = !DILocation(line: 38, column: 38, scope: !29)
!37 = !DILocation(line: 38, column: 31, scope: !29)
!38 = !DILocation(line: 38, column: 46, scope: !29)
!39 = !DILocation(line: 38, column: 51, scope: !29)
!40 = !DILocation(line: 39, column: 19, scope: !29)
!41 = !DILocation(line: 39, column: 9, scope: !29)
!42 = !DILocation(line: 40, column: 14, scope: !29)
!43 = !DILocation(line: 40, column: 9, scope: !29)
!44 = !DILocation(line: 42, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_64b_goodG2BSink", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !45, file: !14, line: 49, type: !17)
!47 = !DILocation(line: 49, column: 85, scope: !45)
!48 = !DILocalVariable(name: "dataPtr", scope: !45, file: !14, line: 52, type: !4)
!49 = !DILocation(line: 52, column: 14, scope: !45)
!50 = !DILocation(line: 52, column: 34, scope: !45)
!51 = !DILocation(line: 52, column: 24, scope: !45)
!52 = !DILocalVariable(name: "data", scope: !45, file: !14, line: 54, type: !5)
!53 = !DILocation(line: 54, column: 12, scope: !45)
!54 = !DILocation(line: 54, column: 21, scope: !45)
!55 = !DILocation(line: 54, column: 20, scope: !45)
!56 = !DILocalVariable(name: "source", scope: !57, file: !14, line: 56, type: !30)
!57 = distinct !DILexicalBlock(scope: !45, file: !14, line: 55, column: 5)
!58 = !DILocation(line: 56, column: 14, scope: !57)
!59 = !DILocation(line: 59, column: 16, scope: !57)
!60 = !DILocation(line: 59, column: 9, scope: !57)
!61 = !DILocation(line: 59, column: 38, scope: !57)
!62 = !DILocation(line: 59, column: 31, scope: !57)
!63 = !DILocation(line: 59, column: 46, scope: !57)
!64 = !DILocation(line: 59, column: 51, scope: !57)
!65 = !DILocation(line: 60, column: 19, scope: !57)
!66 = !DILocation(line: 60, column: 9, scope: !57)
!67 = !DILocation(line: 61, column: 14, scope: !57)
!68 = !DILocation(line: 61, column: 9, scope: !57)
!69 = !DILocation(line: 63, column: 1, scope: !45)
