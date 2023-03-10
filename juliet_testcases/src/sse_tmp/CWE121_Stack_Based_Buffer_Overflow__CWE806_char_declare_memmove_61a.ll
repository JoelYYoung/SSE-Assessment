; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61b_badSource(i8* %0), !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !34
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %call2 = call i64 @strlen(i8* %3) #7, !dbg !38
  %mul = mul i64 %call2, 1, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %2, i64 %mul, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %4), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #8, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #8, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !72
  store i8* %arraydecay, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61b_goodG2BSource(i8* %0), !dbg !75
  store i8* %call, i8** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !77, metadata !DIExpression()), !dbg !79
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !79
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !80
  %2 = load i8*, i8** %data, align 8, !dbg !81
  %3 = load i8*, i8** %data, align 8, !dbg !82
  %call2 = call i64 @strlen(i8* %3) #7, !dbg !83
  %mul = mul i64 %call2, 1, !dbg !84
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %2, i64 %mul, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  call void @printLine(i8* %4), !dbg !88
  ret void, !dbg !89
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 29, column: 10, scope: !11)
!24 = !DILocation(line: 30, column: 12, scope: !11)
!25 = !DILocation(line: 30, column: 10, scope: !11)
!26 = !DILocation(line: 31, column: 90, scope: !11)
!27 = !DILocation(line: 31, column: 12, scope: !11)
!28 = !DILocation(line: 31, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !12, line: 33, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 33, column: 14, scope: !30)
!35 = !DILocation(line: 35, column: 9, scope: !30)
!36 = !DILocation(line: 35, column: 23, scope: !30)
!37 = !DILocation(line: 35, column: 36, scope: !30)
!38 = !DILocation(line: 35, column: 29, scope: !30)
!39 = !DILocation(line: 35, column: 41, scope: !30)
!40 = !DILocation(line: 36, column: 9, scope: !30)
!41 = !DILocation(line: 36, column: 20, scope: !30)
!42 = !DILocation(line: 37, column: 19, scope: !30)
!43 = !DILocation(line: 37, column: 9, scope: !30)
!44 = !DILocation(line: 39, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_61_good", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 65, column: 5, scope: !45)
!47 = !DILocation(line: 66, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 78, type: !49, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 78, type: !51)
!54 = !DILocation(line: 78, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 78, type: !52)
!56 = !DILocation(line: 78, column: 27, scope: !48)
!57 = !DILocation(line: 81, column: 22, scope: !48)
!58 = !DILocation(line: 81, column: 12, scope: !48)
!59 = !DILocation(line: 81, column: 5, scope: !48)
!60 = !DILocation(line: 83, column: 5, scope: !48)
!61 = !DILocation(line: 84, column: 5, scope: !48)
!62 = !DILocation(line: 85, column: 5, scope: !48)
!63 = !DILocation(line: 88, column: 5, scope: !48)
!64 = !DILocation(line: 89, column: 5, scope: !48)
!65 = !DILocation(line: 90, column: 5, scope: !48)
!66 = !DILocation(line: 92, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 50, type: !16)
!69 = !DILocation(line: 50, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !12, line: 51, type: !20)
!71 = !DILocation(line: 51, column: 10, scope: !67)
!72 = !DILocation(line: 52, column: 12, scope: !67)
!73 = !DILocation(line: 52, column: 10, scope: !67)
!74 = !DILocation(line: 53, column: 94, scope: !67)
!75 = !DILocation(line: 53, column: 12, scope: !67)
!76 = !DILocation(line: 53, column: 10, scope: !67)
!77 = !DILocalVariable(name: "dest", scope: !78, file: !12, line: 55, type: !31)
!78 = distinct !DILexicalBlock(scope: !67, file: !12, line: 54, column: 5)
!79 = !DILocation(line: 55, column: 14, scope: !78)
!80 = !DILocation(line: 57, column: 9, scope: !78)
!81 = !DILocation(line: 57, column: 23, scope: !78)
!82 = !DILocation(line: 57, column: 36, scope: !78)
!83 = !DILocation(line: 57, column: 29, scope: !78)
!84 = !DILocation(line: 57, column: 41, scope: !78)
!85 = !DILocation(line: 58, column: 9, scope: !78)
!86 = !DILocation(line: 58, column: 20, scope: !78)
!87 = !DILocation(line: 59, column: 19, scope: !78)
!88 = !DILocation(line: 59, column: 9, scope: !78)
!89 = !DILocation(line: 61, column: 1, scope: !67)
