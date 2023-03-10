; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !30
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #5, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  call void @printLine(i8* %3), !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  call void @free(i8* %4) #5, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #5, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #5, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i8* null, i8** %data, align 8, !dbg !62
  %0 = load i8*, i8** %data, align 8, !dbg !63
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61b_goodG2BSource(i8* %0), !dbg !64
  store i8* %call, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !66, metadata !DIExpression()), !dbg !68
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !68
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !68
  %2 = load i8*, i8** %data, align 8, !dbg !69
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !70
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #5, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %3), !dbg !73
  %4 = load i8*, i8** %data, align 8, !dbg !74
  call void @free(i8* %4) #5, !dbg !75
  ret void, !dbg !76
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 33, column: 12, scope: !11)
!19 = !DILocation(line: 34, column: 10, scope: !11)
!20 = !DILocation(line: 35, column: 79, scope: !11)
!21 = !DILocation(line: 35, column: 12, scope: !11)
!22 = !DILocation(line: 35, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 37, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 37, column: 14, scope: !24)
!29 = !DILocation(line: 39, column: 16, scope: !24)
!30 = !DILocation(line: 39, column: 22, scope: !24)
!31 = !DILocation(line: 39, column: 9, scope: !24)
!32 = !DILocation(line: 40, column: 19, scope: !24)
!33 = !DILocation(line: 40, column: 9, scope: !24)
!34 = !DILocation(line: 41, column: 14, scope: !24)
!35 = !DILocation(line: 41, column: 9, scope: !24)
!36 = !DILocation(line: 43, column: 1, scope: !11)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_61_good", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 68, column: 5, scope: !37)
!39 = !DILocation(line: 69, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 81, type: !41, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !12, line: 81, type: !43)
!46 = !DILocation(line: 81, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !12, line: 81, type: !44)
!48 = !DILocation(line: 81, column: 27, scope: !40)
!49 = !DILocation(line: 84, column: 22, scope: !40)
!50 = !DILocation(line: 84, column: 12, scope: !40)
!51 = !DILocation(line: 84, column: 5, scope: !40)
!52 = !DILocation(line: 86, column: 5, scope: !40)
!53 = !DILocation(line: 87, column: 5, scope: !40)
!54 = !DILocation(line: 88, column: 5, scope: !40)
!55 = !DILocation(line: 91, column: 5, scope: !40)
!56 = !DILocation(line: 92, column: 5, scope: !40)
!57 = !DILocation(line: 93, column: 5, scope: !40)
!58 = !DILocation(line: 95, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 54, type: !16)
!61 = !DILocation(line: 54, column: 12, scope: !59)
!62 = !DILocation(line: 55, column: 10, scope: !59)
!63 = !DILocation(line: 56, column: 83, scope: !59)
!64 = !DILocation(line: 56, column: 12, scope: !59)
!65 = !DILocation(line: 56, column: 10, scope: !59)
!66 = !DILocalVariable(name: "source", scope: !67, file: !12, line: 58, type: !25)
!67 = distinct !DILexicalBlock(scope: !59, file: !12, line: 57, column: 5)
!68 = !DILocation(line: 58, column: 14, scope: !67)
!69 = !DILocation(line: 60, column: 16, scope: !67)
!70 = !DILocation(line: 60, column: 22, scope: !67)
!71 = !DILocation(line: 60, column: 9, scope: !67)
!72 = !DILocation(line: 61, column: 19, scope: !67)
!73 = !DILocation(line: 61, column: 9, scope: !67)
!74 = !DILocation(line: 62, column: 14, scope: !67)
!75 = !DILocation(line: 62, column: 9, scope: !67)
!76 = !DILocation(line: 64, column: 1, scope: !59)
