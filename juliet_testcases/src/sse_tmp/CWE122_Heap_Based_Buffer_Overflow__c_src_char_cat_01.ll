; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %5), !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* %6) #6, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !71
  store i8* %call, i8** %data, align 8, !dbg !72
  %0 = load i8*, i8** %data, align 8, !dbg !73
  %cmp = icmp eq i8* %0, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !77
  unreachable, !dbg !77

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !80
  %2 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !88
  %5 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %5), !dbg !90
  %6 = load i8*, i8** %data, align 8, !dbg !91
  call void @free(i8* %6) #6, !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 29, column: 12, scope: !14)
!29 = !DILocation(line: 29, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 32, column: 14, scope: !33)
!38 = !DILocation(line: 34, column: 16, scope: !33)
!39 = !DILocation(line: 34, column: 22, scope: !33)
!40 = !DILocation(line: 34, column: 9, scope: !33)
!41 = !DILocation(line: 35, column: 19, scope: !33)
!42 = !DILocation(line: 35, column: 9, scope: !33)
!43 = !DILocation(line: 36, column: 14, scope: !33)
!44 = !DILocation(line: 36, column: 9, scope: !33)
!45 = !DILocation(line: 38, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_good", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 64, column: 5, scope: !46)
!48 = !DILocation(line: 65, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 77, type: !50, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 77, type: !52)
!55 = !DILocation(line: 77, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 77, type: !53)
!57 = !DILocation(line: 77, column: 27, scope: !49)
!58 = !DILocation(line: 80, column: 22, scope: !49)
!59 = !DILocation(line: 80, column: 12, scope: !49)
!60 = !DILocation(line: 80, column: 5, scope: !49)
!61 = !DILocation(line: 82, column: 5, scope: !49)
!62 = !DILocation(line: 83, column: 5, scope: !49)
!63 = !DILocation(line: 84, column: 5, scope: !49)
!64 = !DILocation(line: 87, column: 5, scope: !49)
!65 = !DILocation(line: 88, column: 5, scope: !49)
!66 = !DILocation(line: 89, column: 5, scope: !49)
!67 = !DILocation(line: 91, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !15, line: 47, type: !4)
!70 = !DILocation(line: 47, column: 12, scope: !68)
!71 = !DILocation(line: 48, column: 20, scope: !68)
!72 = !DILocation(line: 48, column: 10, scope: !68)
!73 = !DILocation(line: 49, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !15, line: 49, column: 9)
!75 = !DILocation(line: 49, column: 14, scope: !74)
!76 = !DILocation(line: 49, column: 9, scope: !68)
!77 = !DILocation(line: 49, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 49, column: 23)
!79 = !DILocation(line: 51, column: 12, scope: !68)
!80 = !DILocation(line: 51, column: 5, scope: !68)
!81 = !DILocation(line: 52, column: 5, scope: !68)
!82 = !DILocation(line: 52, column: 16, scope: !68)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !15, line: 54, type: !34)
!84 = distinct !DILexicalBlock(scope: !68, file: !15, line: 53, column: 5)
!85 = !DILocation(line: 54, column: 14, scope: !84)
!86 = !DILocation(line: 56, column: 16, scope: !84)
!87 = !DILocation(line: 56, column: 22, scope: !84)
!88 = !DILocation(line: 56, column: 9, scope: !84)
!89 = !DILocation(line: 57, column: 19, scope: !84)
!90 = !DILocation(line: 57, column: 9, scope: !84)
!91 = !DILocation(line: 58, column: 14, scope: !84)
!92 = !DILocation(line: 58, column: 9, scope: !84)
!93 = !DILocation(line: 60, column: 1, scope: !68)
