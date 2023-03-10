; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61b_badSource(i8* %0), !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !34
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %4), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #7, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #7, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !70
  store i8* %arraydecay, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61b_goodG2BSource(i8* %0), !dbg !73
  store i8* %call, i8** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !75, metadata !DIExpression()), !dbg !77
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !77
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !78
  %2 = load i8*, i8** %data, align 8, !dbg !79
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !80
  %3 = load i8*, i8** %data, align 8, !dbg !81
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !82
  %4 = load i8*, i8** %data, align 8, !dbg !83
  call void @printLine(i8* %4), !dbg !84
  ret void, !dbg !85
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61_bad", scope: !12, file: !12, line: 32, type: !13, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 34, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 34, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 35, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 35, column: 10, scope: !11)
!24 = !DILocation(line: 36, column: 12, scope: !11)
!25 = !DILocation(line: 36, column: 10, scope: !11)
!26 = !DILocation(line: 37, column: 91, scope: !11)
!27 = !DILocation(line: 37, column: 12, scope: !11)
!28 = !DILocation(line: 37, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !12, line: 39, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 39, column: 14, scope: !30)
!35 = !DILocation(line: 41, column: 18, scope: !30)
!36 = !DILocation(line: 41, column: 31, scope: !30)
!37 = !DILocation(line: 41, column: 24, scope: !30)
!38 = !DILocation(line: 41, column: 44, scope: !30)
!39 = !DILocation(line: 41, column: 9, scope: !30)
!40 = !DILocation(line: 42, column: 19, scope: !30)
!41 = !DILocation(line: 42, column: 9, scope: !30)
!42 = !DILocation(line: 44, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_61_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 69, column: 5, scope: !43)
!45 = !DILocation(line: 70, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !47, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 82, type: !49)
!52 = !DILocation(line: 82, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 82, type: !50)
!54 = !DILocation(line: 82, column: 27, scope: !46)
!55 = !DILocation(line: 85, column: 22, scope: !46)
!56 = !DILocation(line: 85, column: 12, scope: !46)
!57 = !DILocation(line: 85, column: 5, scope: !46)
!58 = !DILocation(line: 87, column: 5, scope: !46)
!59 = !DILocation(line: 88, column: 5, scope: !46)
!60 = !DILocation(line: 89, column: 5, scope: !46)
!61 = !DILocation(line: 92, column: 5, scope: !46)
!62 = !DILocation(line: 93, column: 5, scope: !46)
!63 = !DILocation(line: 94, column: 5, scope: !46)
!64 = !DILocation(line: 96, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 55, type: !16)
!67 = !DILocation(line: 55, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !12, line: 56, type: !20)
!69 = !DILocation(line: 56, column: 10, scope: !65)
!70 = !DILocation(line: 57, column: 12, scope: !65)
!71 = !DILocation(line: 57, column: 10, scope: !65)
!72 = !DILocation(line: 58, column: 95, scope: !65)
!73 = !DILocation(line: 58, column: 12, scope: !65)
!74 = !DILocation(line: 58, column: 10, scope: !65)
!75 = !DILocalVariable(name: "dest", scope: !76, file: !12, line: 60, type: !31)
!76 = distinct !DILexicalBlock(scope: !65, file: !12, line: 59, column: 5)
!77 = !DILocation(line: 60, column: 14, scope: !76)
!78 = !DILocation(line: 62, column: 18, scope: !76)
!79 = !DILocation(line: 62, column: 31, scope: !76)
!80 = !DILocation(line: 62, column: 24, scope: !76)
!81 = !DILocation(line: 62, column: 44, scope: !76)
!82 = !DILocation(line: 62, column: 9, scope: !76)
!83 = !DILocation(line: 63, column: 19, scope: !76)
!84 = !DILocation(line: 63, column: 9, scope: !76)
!85 = !DILocation(line: 65, column: 1, scope: !65)
