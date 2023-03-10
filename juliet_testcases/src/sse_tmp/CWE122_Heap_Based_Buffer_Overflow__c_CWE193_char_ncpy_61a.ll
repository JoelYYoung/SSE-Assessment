; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !30
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !31
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !32
  %add = add i64 %call2, 1, !dbg !33
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* %3), !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  call void @free(i8* %4) #7, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #7, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #7, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i8* null, i8** %data, align 8, !dbg !65
  %0 = load i8*, i8** %data, align 8, !dbg !66
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_goodG2BSource(i8* %0), !dbg !67
  store i8* %call, i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !69, metadata !DIExpression()), !dbg !71
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !71
  %2 = load i8*, i8** %data, align 8, !dbg !72
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !73
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !74
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !75
  %add = add i64 %call2, 1, !dbg !76
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !77
  %3 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %3), !dbg !79
  %4 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* %4) #7, !dbg !81
  ret void, !dbg !82
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 33, column: 12, scope: !11)
!19 = !DILocation(line: 34, column: 10, scope: !11)
!20 = !DILocation(line: 35, column: 80, scope: !11)
!21 = !DILocation(line: 35, column: 12, scope: !11)
!22 = !DILocation(line: 35, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 37, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 37, column: 14, scope: !24)
!29 = !DILocation(line: 40, column: 17, scope: !24)
!30 = !DILocation(line: 40, column: 23, scope: !24)
!31 = !DILocation(line: 40, column: 38, scope: !24)
!32 = !DILocation(line: 40, column: 31, scope: !24)
!33 = !DILocation(line: 40, column: 46, scope: !24)
!34 = !DILocation(line: 40, column: 9, scope: !24)
!35 = !DILocation(line: 41, column: 19, scope: !24)
!36 = !DILocation(line: 41, column: 9, scope: !24)
!37 = !DILocation(line: 42, column: 14, scope: !24)
!38 = !DILocation(line: 42, column: 9, scope: !24)
!39 = !DILocation(line: 44, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 70, column: 5, scope: !40)
!42 = !DILocation(line: 71, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !44, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 83, type: !46)
!49 = !DILocation(line: 83, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 83, type: !47)
!51 = !DILocation(line: 83, column: 27, scope: !43)
!52 = !DILocation(line: 86, column: 22, scope: !43)
!53 = !DILocation(line: 86, column: 12, scope: !43)
!54 = !DILocation(line: 86, column: 5, scope: !43)
!55 = !DILocation(line: 88, column: 5, scope: !43)
!56 = !DILocation(line: 89, column: 5, scope: !43)
!57 = !DILocation(line: 90, column: 5, scope: !43)
!58 = !DILocation(line: 93, column: 5, scope: !43)
!59 = !DILocation(line: 94, column: 5, scope: !43)
!60 = !DILocation(line: 95, column: 5, scope: !43)
!61 = !DILocation(line: 97, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 55, type: !16)
!64 = !DILocation(line: 55, column: 12, scope: !62)
!65 = !DILocation(line: 56, column: 10, scope: !62)
!66 = !DILocation(line: 57, column: 84, scope: !62)
!67 = !DILocation(line: 57, column: 12, scope: !62)
!68 = !DILocation(line: 57, column: 10, scope: !62)
!69 = !DILocalVariable(name: "source", scope: !70, file: !12, line: 59, type: !25)
!70 = distinct !DILexicalBlock(scope: !62, file: !12, line: 58, column: 5)
!71 = !DILocation(line: 59, column: 14, scope: !70)
!72 = !DILocation(line: 62, column: 17, scope: !70)
!73 = !DILocation(line: 62, column: 23, scope: !70)
!74 = !DILocation(line: 62, column: 38, scope: !70)
!75 = !DILocation(line: 62, column: 31, scope: !70)
!76 = !DILocation(line: 62, column: 46, scope: !70)
!77 = !DILocation(line: 62, column: 9, scope: !70)
!78 = !DILocation(line: 63, column: 19, scope: !70)
!79 = !DILocation(line: 63, column: 9, scope: !70)
!80 = !DILocation(line: 64, column: 14, scope: !70)
!81 = !DILocation(line: 64, column: 9, scope: !70)
!82 = !DILocation(line: 66, column: 1, scope: !62)
