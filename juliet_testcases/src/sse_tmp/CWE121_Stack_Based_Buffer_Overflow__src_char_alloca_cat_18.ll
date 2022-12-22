; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  br label %source, !dbg !24

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !25), !dbg !26
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !38
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !39
  %6 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %6), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18_good() #0 !dbg !43 {
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
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 100, align 16, !dbg !70
  store i8* %0, i8** %dataBuffer, align 8, !dbg !69
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  store i8* %1, i8** %data, align 8, !dbg !72
  br label %source, !dbg !73

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !74), !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !77
  %3 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !82
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !83
  %5 = load i8*, i8** %data, align 8, !dbg !84
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !85
  %6 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* %6), !dbg !87
  ret void, !dbg !88
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILabel(scope: !13, name: "source", file: !14, line: 29)
!26 = !DILocation(line: 29, column: 1, scope: !13)
!27 = !DILocation(line: 31, column: 12, scope: !13)
!28 = !DILocation(line: 31, column: 5, scope: !13)
!29 = !DILocation(line: 32, column: 5, scope: !13)
!30 = !DILocation(line: 32, column: 17, scope: !13)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !14, line: 34, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 34, column: 14, scope: !32)
!37 = !DILocation(line: 36, column: 16, scope: !32)
!38 = !DILocation(line: 36, column: 22, scope: !32)
!39 = !DILocation(line: 36, column: 9, scope: !32)
!40 = !DILocation(line: 37, column: 19, scope: !32)
!41 = !DILocation(line: 37, column: 9, scope: !32)
!42 = !DILocation(line: 39, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_18_good", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 66, column: 5, scope: !43)
!45 = !DILocation(line: 67, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 79, type: !47, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 79, type: !49)
!52 = !DILocation(line: 79, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 79, type: !50)
!54 = !DILocation(line: 79, column: 27, scope: !46)
!55 = !DILocation(line: 82, column: 22, scope: !46)
!56 = !DILocation(line: 82, column: 12, scope: !46)
!57 = !DILocation(line: 82, column: 5, scope: !46)
!58 = !DILocation(line: 84, column: 5, scope: !46)
!59 = !DILocation(line: 85, column: 5, scope: !46)
!60 = !DILocation(line: 86, column: 5, scope: !46)
!61 = !DILocation(line: 89, column: 5, scope: !46)
!62 = !DILocation(line: 90, column: 5, scope: !46)
!63 = !DILocation(line: 91, column: 5, scope: !46)
!64 = !DILocation(line: 93, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 48, type: !4)
!67 = !DILocation(line: 48, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !14, line: 49, type: !4)
!69 = !DILocation(line: 49, column: 12, scope: !65)
!70 = !DILocation(line: 49, column: 33, scope: !65)
!71 = !DILocation(line: 50, column: 12, scope: !65)
!72 = !DILocation(line: 50, column: 10, scope: !65)
!73 = !DILocation(line: 51, column: 5, scope: !65)
!74 = !DILabel(scope: !65, name: "source", file: !14, line: 52)
!75 = !DILocation(line: 52, column: 1, scope: !65)
!76 = !DILocation(line: 54, column: 12, scope: !65)
!77 = !DILocation(line: 54, column: 5, scope: !65)
!78 = !DILocation(line: 55, column: 5, scope: !65)
!79 = !DILocation(line: 55, column: 16, scope: !65)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !14, line: 57, type: !33)
!81 = distinct !DILexicalBlock(scope: !65, file: !14, line: 56, column: 5)
!82 = !DILocation(line: 57, column: 14, scope: !81)
!83 = !DILocation(line: 59, column: 16, scope: !81)
!84 = !DILocation(line: 59, column: 22, scope: !81)
!85 = !DILocation(line: 59, column: 9, scope: !81)
!86 = !DILocation(line: 60, column: 19, scope: !81)
!87 = !DILocation(line: 60, column: 9, scope: !81)
!88 = !DILocation(line: 62, column: 1, scope: !65)
