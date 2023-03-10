; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !19
  store i8* %call, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61b_badSource(i8* %0), !dbg !22
  store i8* %call1, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %call2 = call i64 @strlen(i8* %3) #8, !dbg !33
  %mul = mul i64 %call2, 1, !dbg !34
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %2, i64 %mul, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* %4), !dbg !38
  %5 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* %5) #7, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61b_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #7, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #7, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !67
  store i8* %call, i8** %data, align 8, !dbg !68
  %0 = load i8*, i8** %data, align 8, !dbg !69
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61b_goodG2BSource(i8* %0), !dbg !70
  store i8* %call1, i8** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !74
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %call2 = call i64 @strlen(i8* %3) #8, !dbg !78
  %mul = mul i64 %call2, 1, !dbg !79
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %2, i64 %mul, i1 false), !dbg !75
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %4 = load i8*, i8** %data, align 8, !dbg !82
  call void @printLine(i8* %4), !dbg !83
  %5 = load i8*, i8** %data, align 8, !dbg !84
  call void @free(i8* %5) #7, !dbg !85
  ret void, !dbg !86
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61b_goodG2BSource(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocation(line: 29, column: 20, scope: !13)
!20 = !DILocation(line: 29, column: 10, scope: !13)
!21 = !DILocation(line: 30, column: 83, scope: !13)
!22 = !DILocation(line: 30, column: 12, scope: !13)
!23 = !DILocation(line: 30, column: 10, scope: !13)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !14, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocation(line: 34, column: 9, scope: !25)
!31 = !DILocation(line: 34, column: 23, scope: !25)
!32 = !DILocation(line: 34, column: 36, scope: !25)
!33 = !DILocation(line: 34, column: 29, scope: !25)
!34 = !DILocation(line: 34, column: 41, scope: !25)
!35 = !DILocation(line: 35, column: 9, scope: !25)
!36 = !DILocation(line: 35, column: 20, scope: !25)
!37 = !DILocation(line: 36, column: 19, scope: !25)
!38 = !DILocation(line: 36, column: 9, scope: !25)
!39 = !DILocation(line: 37, column: 14, scope: !25)
!40 = !DILocation(line: 37, column: 9, scope: !25)
!41 = !DILocation(line: 39, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_61_good", scope: !14, file: !14, line: 63, type: !15, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 65, column: 5, scope: !42)
!44 = !DILocation(line: 66, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 78, type: !46, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 78, type: !48)
!51 = !DILocation(line: 78, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 78, type: !49)
!53 = !DILocation(line: 78, column: 27, scope: !45)
!54 = !DILocation(line: 81, column: 22, scope: !45)
!55 = !DILocation(line: 81, column: 12, scope: !45)
!56 = !DILocation(line: 81, column: 5, scope: !45)
!57 = !DILocation(line: 83, column: 5, scope: !45)
!58 = !DILocation(line: 84, column: 5, scope: !45)
!59 = !DILocation(line: 85, column: 5, scope: !45)
!60 = !DILocation(line: 88, column: 5, scope: !45)
!61 = !DILocation(line: 89, column: 5, scope: !45)
!62 = !DILocation(line: 90, column: 5, scope: !45)
!63 = !DILocation(line: 92, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 50, type: !4)
!66 = !DILocation(line: 50, column: 12, scope: !64)
!67 = !DILocation(line: 51, column: 20, scope: !64)
!68 = !DILocation(line: 51, column: 10, scope: !64)
!69 = !DILocation(line: 52, column: 87, scope: !64)
!70 = !DILocation(line: 52, column: 12, scope: !64)
!71 = !DILocation(line: 52, column: 10, scope: !64)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !14, line: 54, type: !26)
!73 = distinct !DILexicalBlock(scope: !64, file: !14, line: 53, column: 5)
!74 = !DILocation(line: 54, column: 14, scope: !73)
!75 = !DILocation(line: 56, column: 9, scope: !73)
!76 = !DILocation(line: 56, column: 23, scope: !73)
!77 = !DILocation(line: 56, column: 36, scope: !73)
!78 = !DILocation(line: 56, column: 29, scope: !73)
!79 = !DILocation(line: 56, column: 41, scope: !73)
!80 = !DILocation(line: 57, column: 9, scope: !73)
!81 = !DILocation(line: 57, column: 20, scope: !73)
!82 = !DILocation(line: 58, column: 19, scope: !73)
!83 = !DILocation(line: 58, column: 9, scope: !73)
!84 = !DILocation(line: 59, column: 14, scope: !73)
!85 = !DILocation(line: 59, column: 9, scope: !73)
!86 = !DILocation(line: 61, column: 1, scope: !64)
