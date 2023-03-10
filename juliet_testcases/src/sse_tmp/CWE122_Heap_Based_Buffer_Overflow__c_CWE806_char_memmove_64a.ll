; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !19
  store i8* %call, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !22
  %1 = load i8*, i8** %data, align 8, !dbg !23
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !23
  store i8 0, i8* %arrayidx, align 1, !dbg !24
  %2 = bitcast i8** %data to i8*, !dbg !25
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64b_badSink(i8* %2), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64b_badSink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64_good() #0 !dbg !28 {
entry:
  call void @goodG2B(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !36, metadata !DIExpression()), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %call = call i64 @time(i64* null) #5, !dbg !40
  %conv = trunc i64 %call to i32, !dbg !41
  call void @srand(i32 %conv) #5, !dbg !42
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !43
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64_good(), !dbg !44
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !45
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !46
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64_bad(), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !48
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !50 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !53
  store i8* %call, i8** %data, align 8, !dbg !54
  %0 = load i8*, i8** %data, align 8, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !56
  %1 = load i8*, i8** %data, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %2 = bitcast i8** %data to i8*, !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64b_goodG2BSink(i8* %2), !dbg !60
  ret void, !dbg !61
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64b_goodG2BSink(i8*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocation(line: 29, column: 20, scope: !13)
!20 = !DILocation(line: 29, column: 10, scope: !13)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 5, scope: !13)
!23 = !DILocation(line: 32, column: 5, scope: !13)
!24 = !DILocation(line: 32, column: 17, scope: !13)
!25 = !DILocation(line: 33, column: 74, scope: !13)
!26 = !DILocation(line: 33, column: 5, scope: !13)
!27 = !DILocation(line: 34, column: 1, scope: !13)
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_64_good", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 55, column: 5, scope: !28)
!30 = !DILocation(line: 56, column: 1, scope: !28)
!31 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 68, type: !32, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !14, line: 68, type: !34)
!37 = !DILocation(line: 68, column: 14, scope: !31)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !14, line: 68, type: !35)
!39 = !DILocation(line: 68, column: 27, scope: !31)
!40 = !DILocation(line: 71, column: 22, scope: !31)
!41 = !DILocation(line: 71, column: 12, scope: !31)
!42 = !DILocation(line: 71, column: 5, scope: !31)
!43 = !DILocation(line: 73, column: 5, scope: !31)
!44 = !DILocation(line: 74, column: 5, scope: !31)
!45 = !DILocation(line: 75, column: 5, scope: !31)
!46 = !DILocation(line: 78, column: 5, scope: !31)
!47 = !DILocation(line: 79, column: 5, scope: !31)
!48 = !DILocation(line: 80, column: 5, scope: !31)
!49 = !DILocation(line: 82, column: 5, scope: !31)
!50 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 43, type: !15, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", scope: !50, file: !14, line: 45, type: !4)
!52 = !DILocation(line: 45, column: 12, scope: !50)
!53 = !DILocation(line: 46, column: 20, scope: !50)
!54 = !DILocation(line: 46, column: 10, scope: !50)
!55 = !DILocation(line: 48, column: 12, scope: !50)
!56 = !DILocation(line: 48, column: 5, scope: !50)
!57 = !DILocation(line: 49, column: 5, scope: !50)
!58 = !DILocation(line: 49, column: 16, scope: !50)
!59 = !DILocation(line: 50, column: 78, scope: !50)
!60 = !DILocation(line: 50, column: 5, scope: !50)
!61 = !DILocation(line: 51, column: 1, scope: !50)
