; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !22
  %1 = load i8*, i8** %data.addr, align 8, !dbg !23
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !24
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !25
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !26
  %add = add i64 %call, 1, !dbg !27
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay, i64 %add) #7, !dbg !28
  %2 = load i8*, i8** %data.addr, align 8, !dbg !29
  call void @printLine(i8* %2), !dbg !30
  %3 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @free(i8* %3) #7, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_goodG2BSink(i8* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  %1 = load i8*, i8** %data.addr, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !43
  %add = add i64 %call, 1, !dbg !44
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay, i64 %add) #7, !dbg !45
  %2 = load i8*, i8** %data.addr, align 8, !dbg !46
  call void @printLine(i8* %2), !dbg !47
  %3 = load i8*, i8** %data.addr, align 8, !dbg !48
  call void @free(i8* %3) #7, !dbg !49
  ret void, !dbg !50
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_badSink", scope: !10, file: !10, line: 30, type: !11, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b.c", directory: "/home/joelyang/SSE-Assessment")
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
!23 = !DILocation(line: 36, column: 17, scope: !18)
!24 = !DILocation(line: 36, column: 23, scope: !18)
!25 = !DILocation(line: 36, column: 38, scope: !18)
!26 = !DILocation(line: 36, column: 31, scope: !18)
!27 = !DILocation(line: 36, column: 46, scope: !18)
!28 = !DILocation(line: 36, column: 9, scope: !18)
!29 = !DILocation(line: 37, column: 19, scope: !18)
!30 = !DILocation(line: 37, column: 9, scope: !18)
!31 = !DILocation(line: 38, column: 14, scope: !18)
!32 = !DILocation(line: 38, column: 9, scope: !18)
!33 = !DILocation(line: 40, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_51b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !10, line: 47, type: !13)
!36 = !DILocation(line: 47, column: 83, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !10, line: 50, type: !19)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 49, column: 5)
!39 = !DILocation(line: 50, column: 14, scope: !38)
!40 = !DILocation(line: 53, column: 17, scope: !38)
!41 = !DILocation(line: 53, column: 23, scope: !38)
!42 = !DILocation(line: 53, column: 38, scope: !38)
!43 = !DILocation(line: 53, column: 31, scope: !38)
!44 = !DILocation(line: 53, column: 46, scope: !38)
!45 = !DILocation(line: 53, column: 9, scope: !38)
!46 = !DILocation(line: 54, column: 19, scope: !38)
!47 = !DILocation(line: 54, column: 9, scope: !38)
!48 = !DILocation(line: 55, column: 14, scope: !38)
!49 = !DILocation(line: 55, column: 9, scope: !38)
!50 = !DILocation(line: 57, column: 1, scope: !34)
