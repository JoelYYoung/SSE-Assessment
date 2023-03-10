; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !28
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !29
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !30
  %add = add i64 %call, 1, !dbg !31
  %mul = mul i64 %add, 1, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !28
  %4 = load i8*, i8** %data, align 8, !dbg !33
  call void @printLine(i8* %4), !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void @free(i8* %5) #7, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_goodG2BSink(i8** %dataArray) #0 !dbg !38 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !43
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !43
  store i8* %1, i8** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !50
  %add = add i64 %call, 1, !dbg !51
  %mul = mul i64 %add, 1, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %4), !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  call void @free(i8* %5) #7, !dbg !56
  ret void, !dbg !57
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!17 = !DILocation(line: 28, column: 82, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 31, type: !14)
!19 = !DILocation(line: 31, column: 12, scope: !9)
!20 = !DILocation(line: 31, column: 19, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 33, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 33, column: 14, scope: !22)
!27 = !DILocation(line: 36, column: 17, scope: !22)
!28 = !DILocation(line: 36, column: 9, scope: !22)
!29 = !DILocation(line: 36, column: 39, scope: !22)
!30 = !DILocation(line: 36, column: 32, scope: !22)
!31 = !DILocation(line: 36, column: 47, scope: !22)
!32 = !DILocation(line: 36, column: 52, scope: !22)
!33 = !DILocation(line: 37, column: 19, scope: !22)
!34 = !DILocation(line: 37, column: 9, scope: !22)
!35 = !DILocation(line: 38, column: 14, scope: !22)
!36 = !DILocation(line: 38, column: 9, scope: !22)
!37 = !DILocation(line: 40, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_66b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "dataArray", arg: 1, scope: !38, file: !10, line: 47, type: !13)
!40 = !DILocation(line: 47, column: 86, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !10, line: 49, type: !14)
!42 = !DILocation(line: 49, column: 12, scope: !38)
!43 = !DILocation(line: 49, column: 19, scope: !38)
!44 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 51, type: !23)
!45 = distinct !DILexicalBlock(scope: !38, file: !10, line: 50, column: 5)
!46 = !DILocation(line: 51, column: 14, scope: !45)
!47 = !DILocation(line: 54, column: 17, scope: !45)
!48 = !DILocation(line: 54, column: 9, scope: !45)
!49 = !DILocation(line: 54, column: 39, scope: !45)
!50 = !DILocation(line: 54, column: 32, scope: !45)
!51 = !DILocation(line: 54, column: 47, scope: !45)
!52 = !DILocation(line: 54, column: 52, scope: !45)
!53 = !DILocation(line: 55, column: 19, scope: !45)
!54 = !DILocation(line: 55, column: 9, scope: !45)
!55 = !DILocation(line: 56, column: 14, scope: !45)
!56 = !DILocation(line: 56, column: 9, scope: !45)
!57 = !DILocation(line: 58, column: 1, scope: !38)
