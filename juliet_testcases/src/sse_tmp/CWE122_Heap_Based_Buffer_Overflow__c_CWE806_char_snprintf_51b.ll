; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !22
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !23
  %1 = load i8*, i8** %data.addr, align 8, !dbg !24
  %call = call i64 @strlen(i8* %1) #6, !dbg !25
  %2 = load i8*, i8** %data.addr, align 8, !dbg !26
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #7, !dbg !27
  %3 = load i8*, i8** %data.addr, align 8, !dbg !28
  call void @printLine(i8* %3), !dbg !29
  %4 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @free(i8* %4) #7, !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b_goodG2BSink(i8* %data) #0 !dbg !33 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %1 = load i8*, i8** %data.addr, align 8, !dbg !40
  %call = call i64 @strlen(i8* %1) #6, !dbg !41
  %2 = load i8*, i8** %data.addr, align 8, !dbg !42
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #7, !dbg !43
  %3 = load i8*, i8** %data.addr, align 8, !dbg !44
  call void @printLine(i8* %3), !dbg !45
  %4 = load i8*, i8** %data.addr, align 8, !dbg !46
  call void @free(i8* %4) #7, !dbg !47
  ret void, !dbg !48
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b_badSink", scope: !10, file: !10, line: 31, type: !11, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 31, type: !13)
!16 = !DILocation(line: 31, column: 83, scope: !9)
!17 = !DILocalVariable(name: "dest", scope: !18, file: !10, line: 34, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 33, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 400, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 50)
!22 = !DILocation(line: 34, column: 14, scope: !18)
!23 = !DILocation(line: 36, column: 18, scope: !18)
!24 = !DILocation(line: 36, column: 31, scope: !18)
!25 = !DILocation(line: 36, column: 24, scope: !18)
!26 = !DILocation(line: 36, column: 44, scope: !18)
!27 = !DILocation(line: 36, column: 9, scope: !18)
!28 = !DILocation(line: 37, column: 19, scope: !18)
!29 = !DILocation(line: 37, column: 9, scope: !18)
!30 = !DILocation(line: 38, column: 14, scope: !18)
!31 = !DILocation(line: 38, column: 9, scope: !18)
!32 = !DILocation(line: 40, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_51b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "data", arg: 1, scope: !33, file: !10, line: 47, type: !13)
!35 = !DILocation(line: 47, column: 87, scope: !33)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !10, line: 50, type: !19)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 49, column: 5)
!38 = !DILocation(line: 50, column: 14, scope: !37)
!39 = !DILocation(line: 52, column: 18, scope: !37)
!40 = !DILocation(line: 52, column: 31, scope: !37)
!41 = !DILocation(line: 52, column: 24, scope: !37)
!42 = !DILocation(line: 52, column: 44, scope: !37)
!43 = !DILocation(line: 52, column: 9, scope: !37)
!44 = !DILocation(line: 53, column: 19, scope: !37)
!45 = !DILocation(line: 53, column: 9, scope: !37)
!46 = !DILocation(line: 54, column: 14, scope: !37)
!47 = !DILocation(line: 54, column: 9, scope: !37)
!48 = !DILocation(line: 56, column: 1, scope: !33)
