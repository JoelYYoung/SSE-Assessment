; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataArray = alloca [5 x i8*], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !19, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx1 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !31
  store i8* %2, i8** %arrayidx1, align 16, !dbg !32
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !33
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_badSink(i8** %arraydecay), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_badSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i64 @time(i64* null) #5, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !49
  call void @srand(i32 %conv) #5, !dbg !50
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66_good(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66_bad(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !58 {
entry:
  %data = alloca i8*, align 8
  %dataArray = alloca [5 x i8*], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !63
  store i8* %call, i8** %data, align 8, !dbg !64
  %0 = load i8*, i8** %data, align 8, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !66
  %1 = load i8*, i8** %data, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !67
  store i8 0, i8* %arrayidx, align 1, !dbg !68
  %2 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !70
  store i8* %2, i8** %arrayidx1, align 16, !dbg !71
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_goodG2BSink(i8** %arraydecay), !dbg !73
  ret void, !dbg !74
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66b_goodG2BSink(i8**) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataArray", scope: !13, file: !14, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 5)
!23 = !DILocation(line: 29, column: 12, scope: !13)
!24 = !DILocation(line: 30, column: 20, scope: !13)
!25 = !DILocation(line: 30, column: 10, scope: !13)
!26 = !DILocation(line: 32, column: 12, scope: !13)
!27 = !DILocation(line: 32, column: 5, scope: !13)
!28 = !DILocation(line: 33, column: 5, scope: !13)
!29 = !DILocation(line: 33, column: 17, scope: !13)
!30 = !DILocation(line: 35, column: 20, scope: !13)
!31 = !DILocation(line: 35, column: 5, scope: !13)
!32 = !DILocation(line: 35, column: 18, scope: !13)
!33 = !DILocation(line: 36, column: 67, scope: !13)
!34 = !DILocation(line: 36, column: 5, scope: !13)
!35 = !DILocation(line: 37, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_66_good", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 60, column: 5, scope: !36)
!38 = !DILocation(line: 61, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 73, type: !40, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !42, !43}
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !14, line: 73, type: !42)
!45 = !DILocation(line: 73, column: 14, scope: !39)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !14, line: 73, type: !43)
!47 = !DILocation(line: 73, column: 27, scope: !39)
!48 = !DILocation(line: 76, column: 22, scope: !39)
!49 = !DILocation(line: 76, column: 12, scope: !39)
!50 = !DILocation(line: 76, column: 5, scope: !39)
!51 = !DILocation(line: 78, column: 5, scope: !39)
!52 = !DILocation(line: 79, column: 5, scope: !39)
!53 = !DILocation(line: 80, column: 5, scope: !39)
!54 = !DILocation(line: 83, column: 5, scope: !39)
!55 = !DILocation(line: 84, column: 5, scope: !39)
!56 = !DILocation(line: 85, column: 5, scope: !39)
!57 = !DILocation(line: 87, column: 5, scope: !39)
!58 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !14, line: 48, type: !4)
!60 = !DILocation(line: 48, column: 12, scope: !58)
!61 = !DILocalVariable(name: "dataArray", scope: !58, file: !14, line: 49, type: !20)
!62 = !DILocation(line: 49, column: 12, scope: !58)
!63 = !DILocation(line: 50, column: 20, scope: !58)
!64 = !DILocation(line: 50, column: 10, scope: !58)
!65 = !DILocation(line: 52, column: 12, scope: !58)
!66 = !DILocation(line: 52, column: 5, scope: !58)
!67 = !DILocation(line: 53, column: 5, scope: !58)
!68 = !DILocation(line: 53, column: 16, scope: !58)
!69 = !DILocation(line: 54, column: 20, scope: !58)
!70 = !DILocation(line: 54, column: 5, scope: !58)
!71 = !DILocation(line: 54, column: 18, scope: !58)
!72 = !DILocation(line: 55, column: 71, scope: !58)
!73 = !DILocation(line: 55, column: 5, scope: !58)
!74 = !DILocation(line: 56, column: 1, scope: !58)
